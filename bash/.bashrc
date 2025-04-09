#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wttr.in='curl wttr.in/Pearland'

PS1='[\u@\h \W]\$ '

# --- Yazi Setup ---

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# --- Neovim as default Editor ---

export EDITOR=nvim

# --- iDrive for Linux Package ---

alias idrive='/opt/IDriveForLinux/bin/idrive'

# --- Starship ---
eval "$(starship init bash)"

fastfetch
