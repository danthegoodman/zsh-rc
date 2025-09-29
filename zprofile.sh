export CLICOLOR=1
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init --tabs=4'
export LS_COLORS=GxFxCxDxBxegedabagaced
export TREE_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;33:fi=0:or=4;31'
export EDITOR='vim'
export LSCOLORS=$LS_COLORS

# I like the reversed UI
# I prefer exact searches most of the time. Prefix of ' for fuzzy searching
export FZF_DEFAULT_OPTS="--reverse --exact"

export EQUIS_DIR="$HOME/.equis"

export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM="1"
export PNPM_HOME="$HOME/Library/pnpm"

export PICO_SDK_PATH="$HOME/fork/pico-sdk"
export PICOTOOL_FETCH_FROM_GIT_PATH="$HOME/fork/picotool"

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
manpath[1,0]="/opt/homebrew/share/man"

path=(
  $HOME/prog/js-bin-scripts/bin
  $HOME/prog/bin-scripts
  $HOME/.volta/bin
  $HOME/.asdf/shims
  $HOME/.local/bin # uv
  $HOMEBREW_PREFIX/opt/postgresql@17/bin
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
  /Applications/Wireshark.app/Contents/MacOS
  $HOMEBREW_PREFIX/bin
  $HOMEBREW_PREFIX/sbin
  /usr/local/sbin
  /usr/sbin
  /sbin
  /usr/local/bin
  /usr/bin
  /bin
)

source ~/simpliphi/simpliphi.zprofile
