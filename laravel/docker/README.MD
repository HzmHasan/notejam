# APP setup

The deployment currently uses a single docker container to run the APP and which connects to an external postgresql DB. The container also includes everything that is needed additionally like cloudwatch logging agents. This is a simple approach.



In order to run multiple processes in a docker container at the same time we could use `supervisor` (see `supervisor-[env].json`).

The following environment varaibles are used by the build script
