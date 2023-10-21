#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete, preview.
#
# S3 usage examples:
#   ./run.sh deploy s3-bucket-stack us-east-1 ./s3-bucket.yml ./s3-bucket-parameters.json 
#   ./run.sh preview s3-bucket-stack us-east-1 ./s3-bucket.yml ./s3-bucket-parameters.json 
#   ./run.sh delete s3-bucket-stack us-east-1
#
# Network usage examples:
#   ./run.sh deploy network-stack us-east-1 ./network.yml ./network-parameters.json 
#   ./run.sh preview network-stack us-east-1 ./network.yml ./network-parameters.json 
#   ./run.sh delete network-stack us
#
# Udagram usage examples:
#   ./run.sh deploy udagram-stack us-east-1 ./udagram.yml ./udagram-parameters.json 
#   ./run.sh preview udagram-stack us-east-1 ./udagram.yml ./udagram-parameters.json 
#   ./run.sh delete udagram-stack us-east-1
#

MODE=$1
STACK_NAME=$2
REGION=$3
TEMPLATE_FILE_NAME=$4
PARAMETERS_FILE_NAME=file://$5

# Validate parameters
if [[ $MODE != "deploy" && $MODE != "delete" && $MODE != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    cmd /k
fi

if [ $MODE == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE_NAME \
        --parameter-overrides $PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region=$REGION \
       
fi

if [ $MODE == "delete" ]
then
    aws cloudformation delete-stack --stack-name $STACK_NAME --region=$REGION
fi

if [ $MODE == "preview" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE_NAME \
        --parameter-overrides $PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --no-execute-changeset \
        --region=$REGION
fi

cmd /k