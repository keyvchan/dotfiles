# setup alias
alias vim "nvim"
alias ls "lsd"

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end



# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
