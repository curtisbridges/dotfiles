# Work AWS
alias ecrlogin="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 510467250861.dkr.ecr.us-east-1.amazonaws.com"
export AWS_PROFILE=dre