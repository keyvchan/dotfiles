# agnix Evaluation

- Status: not adopted
- Reviewed: 2026-08-22
- Evaluated release: `agnix-cli` v0.49.0

## Decision

Do not add agnix to `codex-packages.json`, `setup.sh`, Agent Toolbox, or the editor configuration.
The Rust CLI may be reconsidered later as a pinned, read-only trial, but the agnix skill and the
currently available indirect installation paths are not suitable for this repository.

## Rationale

The CLI provides deterministic linting for agent configuration files and has current support for
Codex surfaces including `AGENTS.md`, `.codex/config.toml`, and Agent Plugins 1.0 manifests. Its
cross-platform CI, security checks, fuzzing, and release attestations are encouraging.

It is not being adopted because the benefit has not yet been demonstrated against this repository,
while the following costs and risks remain:

- The bundled skill is only a thin wrapper around the CLI, contains Claude-specific metadata, and
  installs an unpinned version. It does not meet Agent Toolbox's bar for a distinct reusable skill.
- The current `anthropics/claude-plugins-community` catalog does not list agnix, and the upstream
  Homebrew tap was still pinned to v0.18.0 when v0.49.0 was current.
- Default text diagnostics can reproduce the complete source line, which may expose a detected
  secret in terminal or CI logs. JSON or GitHub output would be required for a trial.
- File symlinks can be read even though the security documentation says symlinks are rejected.
  Fixes refuse to write through symlinks, but the read and output behavior makes untrusted
  repositories unsafe by default.
- `--fix` has no backup and can normalize line endings or lose metadata beyond ordinary Unix
  permissions. Even high-confidence fixes require a dry run and manual diff review.
- The project is pre-1.0, moves quickly, and has some drift between its rule metadata and
  documentation. Any future use should pin an exact version.

## Reconsideration Criteria

Re-evaluate agnix only when there is a concrete linting problem that existing checks do not catch.
A trial should:

1. Pin `agnix-cli` to an exact release and verify its checksum or release attestation.
2. Run only on trusted repositories with `tools = ["codex"]`.
3. Use JSON or GitHub output, without strict mode or write-enabled fixes.
4. Compare findings and false positives across two or three representative repositories.
5. Review `--fix --dry-run --verbose` output and the Git diff before allowing any write.

Adoption should proceed only if the trial finds useful, repeatable issues with an acceptable false
positive rate. LSP or Neovim integration should remain a separate later decision.

## References

- [agnix repository](https://github.com/agent-sh/agnix)
- [agnix v0.49.0 release](https://github.com/agent-sh/agnix/releases/tag/v0.49.0)
- [Claude plugins community](https://github.com/anthropics/claude-plugins-community)
- [Agent Plugins 1.0 schema](https://agent-plugins.org/schemas/1.0.0/plugin.schema.json)
