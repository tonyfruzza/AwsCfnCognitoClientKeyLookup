#!/bin/sh
STACK_NAME=cognito-app-secret1
REGION=us-west-2
USER_POOL_ID=us-west-2_stsMg1lkA
CLIENT_ID=3d0ido3qhudnqe01bu7ml4lqkt

aws --region $REGION cloudformation deploy --template-file cognito-app-secret.yml --stack-name $STACK_NAME --capabilities CAPABILITY_IAM\
 --parameter-overrides UserPoolId=$USER_POOL_ID ClientId=$CLIENT_ID

# Optionally a stand alone stack can now reference the above CFN template to gain the same information
# LAMBDA_ARN=$(aws --region $REGION cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey == `LambdaFunctionArn`].{out:OutputValue}' --output text)
# aws --region $REGION cloudformation deploy --template-file do-cog-lookup.yml --stack-name cog-lookup\
#  --parameter-overrides UserPoolId=$USER_POOL_ID ClientId=$CLIENT_ID "FunctionArn=$LAMBDA_ARN"
