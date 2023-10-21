# CD12352 - Infrastructure as Code Project Solution
# [Manh Luu Duc]

## Spin up instructions
#### 1. Create S3 Bucket stack, use below command
`./run.sh deploy s3-bucket-stack us-east-1 ./s3-bucket.yml ./s3-bucket-parameters.json `

#### 2. Create network stack
`./run.sh deploy s3-bucket-stack us-east-1 ./s3-bucket.yml ./s3-bucket-parameters.json`

#### 3. Create Udagram stack 
`./run.sh deploy udagram-stack us-east-1 ./udagram.yml ./udagram-parameters.json `

### Note: You can create the s3 bucket first or the network first, but the udagram must be created after the network is successfully created. After creating, if there are changes, run the command below to update the stack instead of deploying over it or deleting and redeploying.

#### 1. Update S3 Bucket stack
`./run.sh preview s3-bucket-stack us-east-1 ./s3-bucket.yml ./s3-bucket-parameters.json`

#### 2. Update network stack
`./run.sh preview network-stack us-east-1 ./network.yml ./network-parameters.json`

#### 3. Update udagram stack 
`./run.sh preview udagram-stack us-east-1 ./udagram.yml ./udagram-parameters.json`

## Tear down instructions
#### 1. Delete S3 Bucket stack
`./run.sh delete s3-bucket-stack us-east-1`

#### 2. Delete network stack
`./run.sh delete network-stack us-east-1`

#### 3. Delete udagram stack 
`./run.sh delete udagram-stack us-east-1`

### Note: When deleting stacks, it will automatically delete the related resources. Important, to delete the S3 bucket, make sure it is empty.