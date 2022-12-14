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

o2() {
  iterm_bgcolor 000033
  export OS_REPO_HOME="$HOME/outschool2"
}

o1() {
  iterm_bgcolor 000000
  export OS_REPO_HOME="$HOME/outschool"
}


# change the color when SSHing
fancy_ssh() {
  iterm_bgcolor 440000
  ssh $@
  iterm_bgcolor 000000
}

npm_if_not_yarnable() {
  if [[ -f 'yarn.lock' ]]; then
    echo -e "\033[0;31mThis project should be used with yarn instead of npm\033[0m"
    return 1
  fi
  npm "$@"
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

  find "$PWD" -type d -maxdepth 1 -mindepth 1 | sort | while read _DIR_FOR_EACH; do
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
  find "$PWD" -type d -maxdepth 1 -mindepth 1 | sort | while read _DIR_FOR_EACH; do
    cd "$_DIR_FOR_EACH"
    "$@"
  done
  cd "$startdir"
}

# AWS credential switcher
creds(){
  case "$1" in
  drk)
    iterm_badge "DRK"
    export AWS_PROFILE=drk
    ;;
  *)
    echo "Expected one of [drk]"
    ;;
  esac
}

# equis project jumper
x() { source "$HOME/prog/equis/equis.sh" "$@"; }

# outschool change directory
ocd() {
  local result
  result="$(\
    cd "$OS_REPO_HOME" \
      && { echo '.'; \
        gfind . -regextype posix-egrep \
        -regex '.*/(node_modules|dist|cdk.out|.git|.idea|.terraform|.yarn|.next|.yalc)' -prune \
        -o -path "./cdk" -printf '%p\n' \
        -o -regex "./ci/.*/package.json" -printf '%h\n' \
        -o -regex './lang-js/.*/package.json' -printf '%h\n' \
        -o -regex './lang-docker/.*/Dockerfile' -printf '%h\n' \
        -o -regex './terraform/.*/main.tf' -printf '%h\n' \
      } | fzf --reverse --no-sort\
    )"
  [[ -z "$result" ]] && return 1
  cd "$OS_REPO_HOME/${result}"
}
ocda() {
  local result
  result="$(\
    cd ~ \
      && gfind outschool/ -regextype posix-egrep \
        -regex '.*/(node_modules|dist|cdk.out|.git|.idea|.terraform|.yarn)' -prune \
        -o -type d -printf '%p\n' \
      | fzf --reverse --no-sort\
    )"
  [[ -z "$result" ]] && return 1
  cd ~/"${result}"
}

# git change directory
gcd() {
  local gitdir result
  gitdir=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z "$gitdir" ]] && echo "[not a git directory]" && return 1
  result=$(gfind "$gitdir" -type d -not -path '*/\.*' -printf '/%P\n' | fzf --reverse --no-sort)
  [[ -z "$result" ]] && return 1
  cd "${gitdir}${result}"
}
