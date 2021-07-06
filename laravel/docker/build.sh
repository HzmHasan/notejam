#!/bin/sh

echo "===================="
echo "Build $ENVIRON"
echo "===================="

# install dependencies
composer install --prefer-dist --no-dev --no-interaction --optimize-autoloader

# run tests
#php vendor/bin/phpunit


# build docker image
docker build \
     --build-arg=ENVIRON=$ENVIRON \
     --build-arg=DB_CONNECTION=$DB_CONNECTION \
     --build-arg=DB_DATABASE=$DB_DATABASE \
     --build-arg=DB_USERNAME=$DB_USERNAME \
     --build-arg=DB_PORT=$DB_PORT \
     --build-arg=DB_PASSWORD=$DB_PASSWORD \
      -t $IMAGE:$CI_COMMIT_SHA -f docker/Dockerfile .

# push to registry
if [ "$ENVIRON" != "local" ]; then
    docker push $IMAGE:$CI_COMMIT_SHA
fi
