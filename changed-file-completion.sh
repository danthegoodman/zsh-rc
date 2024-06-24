__changed-files-completion() {
  local output="$(
    git diff HEAD --name-only \
    | fzf --info=hidden --no-sort "--select-1" --exit-0 \
  )"
  if [[ -n "$output" ]] ; then
    LBUFFER="$LBUFFER $(grealpath --relative-to="$PWD" "${OS_REPO_HOME}/${output}") "
  fi
}

zle -N __changed-files-completion
bindkey '^T' __changed-files-completion
