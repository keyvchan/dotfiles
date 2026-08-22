# dotfiles

[![CI][ci-badge]][ci]

Configurations of my daily utils.

- Neovim
- Zsh
- SkillHub CLI
- Surge agent skill when bundled with the installed macOS app
- Optional Agent Toolbox setup for Codex
- ShellCheck validation
- Offline bundle builder for GitHub Actions artifacts

## Setup

This repo currently maintains Neovim and Zsh configs, uv-managed user-level Python, Node.js with
pnpm, SkillHub CLI setup, plus optional Agent Toolbox setup for Codex.

```sh
./setup.sh
```

The script installs Neovim nightly, Zsh tooling, uv with Python 3.14 as the user-level default,
Node.js with pnpm for JavaScript dependencies, the SkillHub CLI, and backs up existing config files
before replacing them with links to this repo. It is safe to rerun; existing links and installed
tools are detected and skipped. Agent Toolbox is not installed or updated unless explicitly
requested.

- Arch Linux: bootstraps `paru` when needed, then installs `neovim-git`.
- macOS and other Linux distributions: uses Homebrew to install Neovim HEAD.
- Zsh: uses Starship for the prompt, Antidote for plugin management, and F-Sy-H for syntax
  highlighting.
- Python: installs uv through Homebrew or `paru`, then exposes uv-managed Python 3.14 as `python`
  and `python3` through `~/.local/bin`. The operating system Python remains unchanged.
- Node.js: installs Node.js and pnpm through Homebrew or `paru`; use pnpm for project dependency
  installation and lockfiles.
- SkillHub: installs the CLI through the upstream `--cli-only` bootstrap. It does not change which
  skill source agents prefer or install OpenClaw-specific default skills.
- Shell scripts: installs ShellCheck for local validation.
- Surge: when `/Applications/Surge.app/Contents/Resources/Skills/surge` is available, links it to
  `$CODEX_HOME/skills/surge` (or `~/.codex/skills/surge` by default) so the skill stays current with
  Surge app updates.
- Agent Toolbox: pass `--install-agent-toolbox` to add the
  `chenkeyv/agent-toolbox` marketplace and install `agent-toolbox@agent-toolbox`.

## Offline Bundle

The Go command under `cmd/dotfiles` is only used to build GitHub Actions artifacts. It is not
installed by `setup.sh`.

The daily workflow builds a single multi-call payload for constrained environments:

```sh
go build -trimpath -o /tmp/dotfiles-pack ./cmd/dotfiles
/tmp/dotfiles-pack pack -o cmd/dotfiles/payload
CGO_ENABLED=0 go build -tags embedded -trimpath -o dotfiles-env ./cmd/dotfiles
rm -rf cmd/dotfiles/payload
./dotfiles-env list
./dotfiles-env apply
```

The bundle artifact is a Go binary with the payload embedded through Go's `embed` package, so it
does not require `tar`, `base64`, network access, or sudo on the target host. Daily GitHub Actions
builds publish native artifacts for `linux-amd64`, `darwin-arm64`, and `darwin-amd64`. Each artifact
includes the dotfiles payload plus portable user-space tools downloaded by `scripts/fetch-tools.sh`,
including the latest Neovim nightly for that platform from the daily workflow run.

On an offline host:

```sh
chmod +x dotfiles-env-linux-amd64
./dotfiles-env-linux-amd64 apply
./dotfiles-env-linux-amd64 tool list
./dotfiles-env-linux-amd64 tool nvim --version
./dotfiles-env-linux-amd64 tool rg --version
```

Machine-local Zsh settings, including secrets, proxies, and host-specific paths,
belong in `~/.config/zsh/local.zsh`. That file is sourced by `.zshrc` and is
not tracked by this repo.

Preview changes without writing:

```sh
./setup.sh --dry-run
```

Install only the config links and skip install/update work:

```sh
./setup.sh --skip-neovim-install --skip-zsh-install --skip-python-install \
  --skip-node-install --skip-skillhub-install
```

Skip uv and user-level Python installation:

```sh
./setup.sh --skip-python-install
```

Skip Node.js and pnpm installation:

```sh
./setup.sh --skip-node-install
```

Skip SkillHub CLI installation:

```sh
./setup.sh --skip-skillhub-install
```

Install a SkillHub skill into Codex's user skill directory, then restart Codex:

```sh
skillhub install <skill-name> --dir "${CODEX_HOME:-$HOME/.codex}/skills"
```

Install or update Agent Toolbox explicitly:

```sh
./setup.sh --install-agent-toolbox
```

## Validation

```sh
bash -n setup.sh
bash -n scripts/fetch-tools.sh
shellcheck setup.sh scripts/fetch-tools.sh
go test ./...
CGO_ENABLED=0 go build -trimpath -o /tmp/dotfiles ./cmd/dotfiles
/tmp/dotfiles pack -o cmd/dotfiles/payload
CGO_ENABLED=0 go build -tags embedded -trimpath -o /tmp/dotfiles-embedded ./cmd/dotfiles
rm -rf cmd/dotfiles/payload
zsh -n zsh/zshenv zsh/zprofile zsh/zshrc
```

Or run all local checks with:

```sh
make validate
```

[ci]: https://github.com/chenkeyv/dotfiles/actions/workflows/ci.yml
[ci-badge]: https://github.com/chenkeyv/dotfiles/actions/workflows/ci.yml/badge.svg
