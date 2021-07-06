# Notejam current architecture

 - The current architecture does not scale
 - Deploying new version causes interruption to the service provision 
 - Build-in webserver is not effecient enough to use in production
 - SQLite is not good choice in production because it doesn’t support concurrency and it can’t scale

# Suggested changes

- In general we suggest changing the archietcture to include a loadbalancer which forwards the traffic to different instances of the app. This way we can always add more instances in case of increased traffic.
- Use Nginx as a web-server instead of the built-in one as it is faster and more effecient and better for logging and monitoring.
- Change from SQLITe to postgreSQL for porduction as it supports concurrency and it can scale.
- Dockerize the app and this way it can be deployed on different platforms.
- Use one of the popular cloud providers to deploy and provide the service. Other services for monitoring, logging, backup and restore can be used then. 


# AWS as deployment envirnoment
## EC2 
- EC2 instacnes can be used to run the dockerized app.
- A scaling group for each instance can be defined which allows the instancs to be added or removed based on the load.
- Different groups of instances can be created as separate deployment environment.

# Kubernetes 
- The dokcerized app can be run also in kuberentes platform 
- An autoscaler be used to allow scaling based on cpu usage or traffic.
- One dedicated cluster can be used for porducion.
- Another cluster can be used for staging, QA and testing with different namespace for each.


- An ELB can be created to distribute the traffic to these instances 
- Cloudwatch service can be used to receive logs from the running instances
- RDS service can be used to create postgreSQL instances
- Deploying can be done then by refreshing the instances that are in the scaling group.

-


