# ## Homebrew completions
FPATH="/usr/local/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

## Custom tools
__riza_complete() {
  eval "$(riza --zsh-completion)"
}
compdef __riza_complete riza

#os cli
_os_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" os --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _os_yargs_completions os
