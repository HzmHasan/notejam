# Setup Deployment Environment on AWS

The suggested solution uses EC2 instances to run the applicaiton. Instances are lauched based on a template which pull the latest docker image on start and run a container. A scaling group for the instances is assumed to be created which triggers scaling up and down based on the network load (number of requests) or CPU. 

The script create_infrastructure.sh includes example calls to create the suggested deployment environment. The config files  
Please noe that the calls and the included configs are just exmaples and not tested.

Assuming everything is setup correctly in AWS and a scaling group is created, the deploy.sh script can be used to trigger deployment by refreshing the running instances.  



