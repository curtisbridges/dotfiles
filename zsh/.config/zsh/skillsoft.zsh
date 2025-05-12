# Work AWS
alias ecrlogin="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 510467250861.dkr.ecr.us-east-1.amazonaws.com"
export AWS_PROFILE=psl

alias rmowner="git checkout -- .github/CODEOWNERS ownership/codeowners.yaml"

alias pg_start="brew services start postgresql@16"
alias pg_stop="brew services stop postgresql@16"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

