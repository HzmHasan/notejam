#!/bin/sh
# This is an example of deploying on AWS using autoscaling groups

echo "====================="
echo "Deploy $ENVIRON"
echo "====================="
 
docker pull $IMAGE:$CI_COMMIT_SHA
docker tag $IMAGE:$CI_COMMIT_SHA $IMAGE:latest  
docker push $IMAGE:latest
# Start replacing running instacnes
aws autoscaling start-instance-refresh --auto-scaling-group-name $ENVIRON-asg --preferences '{"InstanceWarmup": 90, "MinHealthyPercentage": 50}'
