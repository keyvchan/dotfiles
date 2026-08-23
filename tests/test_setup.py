from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SETUP = ROOT / "setup.sh"
MARKETPLACE_HELPER = ROOT / "scripts" / "ensure-personal-codex-marketplace.py"
AGENT_TOOLBOX_URL = "https://github.com/chenkeyv/agent-toolbox.git"


class SetupTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp_dir = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp_dir.cleanup)
        self.temp_path = Path(self.temp_dir.name)
        self.home = self.temp_path / "home"
        self.home.mkdir()

    def write_packages(
        self,
        *,
        plugins: list[str] | None = None,
        skills: list[object] | None = None,
    ) -> Path:
        path = self.temp_path / "codex-packages.json"
        path.write_text(
            json.dumps(
                {
                    "version": 1,
                    "plugins": plugins or [],
                    "skills": skills or [],
                }
            ),
            encoding="utf-8",
        )
        return path

    def write_executable(self, directory: Path, name: str, body: str) -> Path:
        directory.mkdir(parents=True, exist_ok=True)
        path = directory / name
        path.write_text("#!/bin/sh\nset -eu\n" + body, encoding="utf-8")
        path.chmod(0o755)
        return path

    def run_setup(
        self,
        packages: Path,
        *,
        skip_skills: bool = False,
        skip_plugins: bool = False,
        env_updates: dict[str, str] | None = None,
    ) -> subprocess.CompletedProcess[str]:
        args = [
            "/bin/bash",
            str(SETUP),
            "--dry-run",
            "--skip-neovim-install",
            "--skip-zsh-install",
            "--skip-python-install",
            "--skip-node-install",
            "--skip-skillhub-install",
            "--packages-file",
            str(packages),
        ]
        if skip_skills:
            args.append("--skip-skill-install")
        if skip_plugins:
            args.append("--skip-plugin-install")

        env = os.environ.copy()
        env.update(
            {
                "HOME": str(self.home),
                "XDG_CONFIG_HOME": str(self.home / ".config"),
                "CODEX_HOME": str(self.home / ".codex"),
            }
        )
        if env_updates:
            env.update(env_updates)

        return subprocess.run(
            args,
            cwd=ROOT,
            env=env,
            check=False,
            capture_output=True,
            text=True,
        )

    def configure_personal_marketplace(self) -> Path:
        marketplace = self.home / ".agents" / "plugins" / "marketplace.json"
        subprocess.run(
            [
                sys.executable,
                str(MARKETPLACE_HELPER),
                str(marketplace),
                AGENT_TOOLBOX_URL,
            ],
            check=True,
        )
        return marketplace

    def fake_codex(self, plugin_id: str) -> Path:
        fake_bin = self.temp_path / "bin"
        payload = json.dumps(
            {
                "installed": [
                    {
                        "pluginId": plugin_id,
                        "installed": True,
                        "enabled": True,
                    }
                ]
            }
        )
        self.write_executable(
            fake_bin,
            "codex",
            "if [ \"$1 $2 $3\" = \"plugin list --json\" ]; then\n"
            f"  printf '%s\\n' '{payload}'\n"
            "  exit 0\n"
            "fi\n"
            "exit 1\n",
        )
        return fake_bin

    def test_personal_marketplace_helper_preserves_other_plugins(self) -> None:
        marketplace = self.home / ".agents" / "plugins" / "marketplace.json"
        marketplace.parent.mkdir(parents=True)
        marketplace.write_text(
            json.dumps(
                {
                    "name": "personal",
                    "interface": {"displayName": "My Plugins"},
                    "plugins": [
                        {
                            "name": "other-plugin",
                            "source": "./plugins/other-plugin",
                            "policy": {
                                "installation": "AVAILABLE",
                                "authentication": "ON_USE",
                            },
                            "category": "Productivity",
                        }
                    ],
                }
            ),
            encoding="utf-8",
        )

        subprocess.run(
            [
                sys.executable,
                str(MARKETPLACE_HELPER),
                str(marketplace),
                AGENT_TOOLBOX_URL,
            ],
            check=True,
        )
        subprocess.run(
            [
                sys.executable,
                str(MARKETPLACE_HELPER),
                "--check",
                str(marketplace),
                AGENT_TOOLBOX_URL,
            ],
            check=True,
        )

        data = json.loads(marketplace.read_text(encoding="utf-8"))
        self.assertEqual(data["interface"]["displayName"], "My Plugins")
        self.assertEqual([entry["name"] for entry in data["plugins"]], [
            "other-plugin",
            "agent-toolbox",
        ])
        self.assertEqual(
            data["plugins"][1]["source"],
            {"source": "url", "url": AGENT_TOOLBOX_URL, "ref": "main"},
        )

    def test_plugin_detection_requires_the_full_selector(self) -> None:
        self.configure_personal_marketplace()
        fake_bin = self.fake_codex("agent-toolbox@other")
        packages = self.write_packages(plugins=["agent-toolbox@personal"])

        result = self.run_setup(
            packages,
            skip_skills=True,
            env_updates={"PATH": f"{fake_bin}:{os.environ['PATH']}"},
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("codex plugin add agent-toolbox@personal", result.stdout)

    def test_fresh_agent_toolbox_dry_run_plans_marketplace_without_writing(self) -> None:
        fake_bin = self.fake_codex("other-plugin@personal")
        packages = self.write_packages(plugins=["agent-toolbox@personal"])
        marketplace = self.home / ".agents" / "plugins" / "marketplace.json"

        result = self.run_setup(
            packages,
            skip_skills=True,
            env_updates={"PATH": f"{fake_bin}:{os.environ['PATH']}"},
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn(
            "Configuring Agent Toolbox in the personal Codex marketplace.",
            result.stdout,
        )
        self.assertIn("codex plugin add agent-toolbox@personal", result.stdout)
        self.assertFalse(marketplace.exists())

    def test_plugin_detection_skips_the_exact_selector(self) -> None:
        self.configure_personal_marketplace()
        fake_bin = self.fake_codex("agent-toolbox@personal")
        packages = self.write_packages(plugins=["agent-toolbox@personal"])

        result = self.run_setup(
            packages,
            skip_skills=True,
            env_updates={"PATH": f"{fake_bin}:{os.environ['PATH']}"},
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn(
            "Codex plugin already installed and enabled: agent-toolbox@personal",
            result.stdout,
        )
        self.assertNotIn("+ codex plugin add", result.stdout)

    def test_package_parser_uses_uv_managed_python_outside_path(self) -> None:
        fake_bin = self.temp_path / "pythonless-bin"
        for command in ("date", "dirname"):
            source = shutil.which(command)
            self.assertIsNotNone(source)
            (fake_bin / command).parent.mkdir(parents=True, exist_ok=True)
            (fake_bin / command).symlink_to(source)
        self.write_executable(
            fake_bin,
            "uv",
            "if [ \"$1 $2\" = \"python find\" ]; then\n"
            "  printf '%s\\n' \"$FAKE_PYTHON\"\n"
            "  exit 0\n"
            "fi\n"
            "exit 1\n",
        )
        packages = self.write_packages()

        result = self.run_setup(
            packages,
            skip_skills=True,
            env_updates={"PATH": str(fake_bin), "FAKE_PYTHON": sys.executable},
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertNotIn("Python 3 is required", result.stderr)

    def test_agent_reach_reinstalls_an_unpinned_existing_tool(self) -> None:
        fake_bin = self.temp_path / "agent-bin"
        tool_dir = self.temp_path / "uv-tools"
        direct_url = (
            tool_dir
            / "agent-reach"
            / "lib"
            / "python3.14"
            / "site-packages"
            / "agent_reach-1.5.0.dist-info"
            / "direct_url.json"
        )
        direct_url.parent.mkdir(parents=True)
        direct_url.write_text(
            json.dumps({"vcs_info": {"commit_id": "old-revision"}}),
            encoding="utf-8",
        )
        self.write_executable(fake_bin, "agent-reach", "exit 0\n")
        self.write_executable(
            fake_bin,
            "uv",
            "if [ \"$1 $2 $3\" = \"tool dir --bin\" ]; then\n"
            "  printf '%s\\n' \"$FAKE_TOOL_BIN\"\n"
            "  exit 0\n"
            "fi\n"
            "if [ \"$1 $2\" = \"tool dir\" ]; then\n"
            "  printf '%s\\n' \"$FAKE_TOOL_DIR\"\n"
            "  exit 0\n"
            "fi\n"
            "exit 1\n",
        )
        revision = "0123456789abcdef0123456789abcdef01234567"
        packages = self.write_packages(
            skills=[
                {
                    "name": "agent-reach",
                    "installer": "uv-tool",
                    "revision": revision,
                }
            ]
        )

        result = self.run_setup(
            packages,
            skip_plugins=True,
            env_updates={
                "PATH": f"{fake_bin}:{os.environ['PATH']}",
                "FAKE_TOOL_BIN": str(fake_bin),
                "FAKE_TOOL_DIR": str(tool_dir),
            },
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("uv tool install --force --from", result.stdout)
        self.assertIn(f"Agent-Reach.git@{revision}", result.stdout)
        self.assertIn("agent-reach skill --install", result.stdout)
        self.assertNotIn("agent-reach setup", result.stdout)

    def test_surge_repairs_an_existing_wrong_directory(self) -> None:
        source = self.temp_path / "SurgeSkill"
        source.mkdir()
        (source / "SKILL.md").write_text("# Surge\n", encoding="utf-8")
        target = self.home / ".codex" / "skills" / "surge"
        target.mkdir(parents=True)
        (target / "SKILL.md").write_text("# Stale\n", encoding="utf-8")
        packages = self.write_packages(
            skills=[{"name": "surge", "installer": "app"}]
        )

        result = self.run_setup(
            packages,
            skip_plugins=True,
            env_updates={"DOTFILES_SURGE_SKILL_SOURCE": str(source)},
        )

        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn(f"mv {target}", result.stdout)
        self.assertIn(f"ln -s {source} {target}", result.stdout)


if __name__ == "__main__":
    unittest.main()
