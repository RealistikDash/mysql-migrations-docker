#!/bin/bash
set -euo pipefail

MYSQL_DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(${MYSQL_HOST}:${MYSQL_TCP_PORT})/${MYSQL_DATABASE}"

echo "Ensuring the existence of database ${MYSQL_DATABASE}."

mysql \
    --host=${MYSQL_HOST} \
    --port=${MYSQL_TCP_PORT} \
    --user=${MYSQL_USER} \
    --password=${MYSQL_PASSWORD} \
    --execute="CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

echo "Performing migrations if required."
go-migrate -path /migrations -database $MYSQL_DSN up
