# custom zsh functions

# note - this is implemented as a function and not a shell script so that
# the "export" statements at the bottom to run in the top-level scope.
aws-login () {
  # do the AWS login flow if we don't have a valid login
  aws sts get-caller-identity > /dev/null || aws sso login

  # login to ECR using the sso credentials
  aws ecr get-login-password --region us-east-1 --profile default | docker login --username AWS --password-stdin docker.strava.com

  # extract AWS environment variables and set them in the shell
  # needed for paasage/mesos commands to work
  JSON_FILE=$(ls $HOME/.aws/cli/cache/*.json)
  export AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' $JSON_FILE)
  export AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' $JSON_FILE)
  export AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' $JSON_FILE)
}
