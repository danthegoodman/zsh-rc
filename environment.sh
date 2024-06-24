export CLICOLOR=1
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init --tabs=4'
export LS_COLORS=GxFxCxDxBxegedabagaced
export TREE_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;33:fi=0:or=4;31'
export EDITOR='vim'
export LSCOLORS=$LS_COLORS

export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_SESSION_TOKEN_TTL=18h

# I like the reversed UI
# I prefer exact searches most of the time. Prefix of ' for fuzzy searching
export FZF_DEFAULT_OPTS="--reverse --exact"

export EQUIS_DIR=$HOME/.equis
export VOLTA_HOME="$HOME/.volta"
export PNPM_HOME="/Users/danny/Library/pnpm"

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

export PATH=\
~/prog/js-bin-scripts/bin:\
~/prog/bin-scripts:\
~/.deno/bin:\
~/.cargo/bin:\
~/.volta/bin:\
$PNPM_HOME:\
/usr/local/opt/postgresql@12/bin:\
/Applications/Wireshark.app/Contents/MacOS:\
/opt/homebrew/bin:\
/opt/homebrew/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin
