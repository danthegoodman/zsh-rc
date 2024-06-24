preexec() {
  print -N -- "$PWD\t$(date +%F%t%T)\t$3" >> ~/.persistent_history
}

__persistent-history-action() {
  local output="$(\
    fzf --query="$1" --read0 --tac --no-sort \
    --with-nth 4.. --delimiter $'\t' \
    --preview='print -rD -- {2} {3} " " {1}' \
    --preview-label="ctrl+space to run in dir" \
    --preview-window='bottom,1,border-top' \
    --bind='enter:become(echo {4..})' \
    --bind='ctrl-space:become(echo cd {1} "&&" {4..})' \
    < ~/.persistent_history)"
  if [[ -n "$output" ]] ; then
    LBUFFER="${output}"
    RBUFFER=""
  fi
}

zle -N __persistent-history-action
bindkey '^R' __persistent-history-action
