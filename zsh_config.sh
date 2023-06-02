# pwd with a colorized sentinel based on the last exit code
PROMPT='%4~%(0?.%F{#aaffaa}.%F{#ffaaaa})❱%f '

# colorized completion
zmodload zsh/complist
zstyle ':completion:*:default' list-colors 'no=0:di=1;36'

# prevent '>' from erasing existing files
unsetopt clobber

# allow comments to be entered (eg when pasting snippets)
setopt interactive_comments

# vim mode
bindkey -v

# swap cursor shape on keymap change
function zle-line-init zle-keymap-select() {
  case $KEYMAP in
    vicmd) print -n -- "\e]50;CursorShape=0\x7";; # block cursor
    viins|main) print -n -- "\e]50;CursorShape=1\x7";; # line cursor
  esac
}
zle -N zle-line-init
zle -N zle-keymap-select
