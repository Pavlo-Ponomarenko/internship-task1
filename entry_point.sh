#!/usr/bin/env bash

set -e

sleep 3

source variables.sh

cat variables.sh

echo "$POSTGRES_IP $POSTGRES_DB $POSTGRES_USER $POSTGRES_PASSWORD"

./scripts/pgsql_restore.sh 2024-08-19.dump $POSTGRES_IP $POSTGRES_DB $POSTGRES_USER $POSTGRES_PASSWORD

gradle test

./scripts/pgsql_restore.sh 2024-08-19.dump $POSTGRES_IP $POSTGRES_DB $POSTGRES_USER $POSTGRES_PASSWORD

cd /usr/local/tomcat/bin

./catalina.sh run
