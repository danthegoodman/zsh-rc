# iterm; growl alert
alert() {
  echo -e $'\e]9;'${@}'\007'
}

# iterm; set the badge text
iterm_badge() {
  __iterm_curr_badge="$@"
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "$@" | base64)
}

# iterm; switch profile
iterm_profile() {
  echo -e '\033]50;SetProfile='$1'\a'
}

# iterm; set background-color to hex-code
iterm_bgcolor() {
  echo -e "\033]Ph$1\033\\"
}

# change the color when SSHing
fancy_ssh() {
  iterm_bgcolor 440000
  ssh $@
  iterm_bgcolor 000000
}

for_each_dir() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: for_each_dir [command or function] [args...]"
    echo '  Executes "{command} {dir} {args...}" for each directory'
    return 1
  fi

  local _DIR_FOR_EACH;
  local _COMMAND_FOR_EACH=$1;
  shift

  for it (*/); do
    "$_COMMAND_FOR_EACH" "$_DIR_FOR_EACH" "$@"
  done
}

in_each_dir() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: in_each_dir [command or function] [args...]"
    echo '  Executes "{command} {args...}" in each directory'
    return 1
  fi

  local startdir="$PWD"
  for it (*/); do
    cd $it
    "$@"
    cd $startdir
  done
  cd "$startdir"
}

# equis project jumper
x() { source "$HOME/prog/equis/equis.sh" "$@"; }

# git change directory
gcd() {
  local gitdir result
  gitdir=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z "$gitdir" ]] && echo "[not a git directory]" && return 1
  result=$(gfind "$gitdir" -type d -not -path '*/\.*' -printf '/%P\n' | fzf --reverse --no-sort)
  [[ -z "$result" ]] && return 1
  cd "${gitdir}${result}"
}
