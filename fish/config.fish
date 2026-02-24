source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end

fzf_key_bindings

abbr rl sudo (which rotz) -d /home/lucas/.dotfiles link
abbr v nvim

set -x PAGER nvim
set -x MANPAGER "nvim +Man!"

zoxide init fish | source
