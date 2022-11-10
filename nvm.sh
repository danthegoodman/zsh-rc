# NVM is super slow to start up. I don't use it regularly, but I do rely
# on it to manage my default version of node.

nvm(){
  echo "Loading nvm..."
  unset -f nvm
  . "/usr/local/opt/nvm/nvm.sh"
  nvm "$@"
}

PATH="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin:$PATH"
