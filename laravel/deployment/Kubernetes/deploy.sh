#!/bin/sh
kubectl apply -f deployment.yaml


# create a service by exposing the pods
kubectl apply -f svc.yaml


# create autoscaler
kubectl autoscale deployment notejam-app --cpu-percent=50 --min=1 --max=10


# Create external loadbalancer
# Please see
# https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/


