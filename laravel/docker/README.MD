# APP setup

The deployment currently uses a single docker container to run the APP and which connects to an external postgresql DB. The container could also include everything that is needed additionally like cloudwatch logging agents. This is a simple approach.

In order to run multiple processes in a docker container at the same time we could use `supervisor` (see `supervisor-[env].json`).

The following environment varaibles are used by the build script:

- $ENVIRON : The name of the environment that you are building for (ex. local, staging, production)
- $IMAGE   : The name of the docker image 
- $CI_COMMIT_SHA : This is the tag of the image. It can be anything however, as the name suggests, it is meant to be the commit sha that you are building.

Please note that before building you should copy the file .env.example.php to .env.php and adjusted the values to include the correct connection information to postgreSQL DB.

