preexec() {
  print -rN -- "$(date +%Y-%m-%dT%H:%M:%S) $3" >> ~/.persistent_history
}

__persistent-history-action() {
  local output="$(fzf --query="$BUFFER" --read0 --reverse --tac --no-sort -n 2.. < ~/.persistent_history | sed -E 's/[^ ]* //')"
  if [[ -n "$output" ]] ; then
    LBUFFER="${output}"
    RBUFFER=""
  fi
}

zle -N __persistent-history-action
bindkey '^R' __persistent-history-action
