#!/bin/bash

loggin=$1
path='/var/lib/postgres/data/'

rm "/var/lib/postgres/data/postgresql.conf"

if [ $loggin -eq 1 ]
then
  ln -s /var/lib/postgres/data/postgresql-withlog.conf /var/lib/postgres/data/postgresql.conf
  echo "Logging enabled"
else
  ln -s /var/lib/postgres/data/postgresql-nolog.conf /var/lib/postgres/data/postgresql.conf
  echo "Logging disabled"
fi

chown -R postgres:postgres /var/lib/postgres/data/
systemctl restart postgresql.service
