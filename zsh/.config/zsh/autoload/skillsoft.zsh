# Work AWS
alias ecrlogin="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 510467250861.dkr.ecr.us-east-1.amazonaws.com"
export AWS_PROFILE=dre

# front build script
alias do='node ./scripts/do'
alias rmowner='git checkout -- .github/CODEOWNERS ownership/codeowners.yaml'

export USER_TERMINAL=Alacritty
