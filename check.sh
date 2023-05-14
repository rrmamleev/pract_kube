#!/bin/bash

SERVICES="redis flask_app"

for service in $SERVICES
do
  echo "Checking status of $service..."
  STATUS=$(docker-compose ps -q $service | xargs docker inspect -f '{{ .State.Health.Status }}')
  if [ "$STATUS" != "running" ]; then
    echo "Service $service is not running"
    exit 1
  fi
done

echo "All services are running"