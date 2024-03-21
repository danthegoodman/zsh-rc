# ssh should always be fancified
alias ssh='fancy_ssh'

alias npm_me='npm --userconfig ~/.npmrc-me'

# git
alias g='git'
alias gst='git status -sb'

# terraform
alias t='terraform'
alias tp='terraform plan'
alias ta='terraform apply'

# GNU grep (brew install grep)
alias grep='ggrep --color=auto'
alias egrep='gegrep --color=auto'
alias fgrep='gfgrep --color=auto'

# grep with perl regexp
alias Pgrep='ggrep --color=auto -P'

# os aws-vault
alias apg="osAwsVaultExec playground"
alias a-pm="osAwsVaultExec outschool-pm-test"

# I use these commands a lot
alias mrs='os merge-requests'
alias dq='os deploy-queue --tail'
