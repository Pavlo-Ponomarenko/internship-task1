#!/bin/bash

#change on your path to PostgreSQL
#pathA=/c/Program\ Files/PostgreSQL/13/bin
#export PATH=$PATH:$pathA

#write your password
PGPASSWORD=$3
export PGPASSWORD

#change the path to the file from which will be made restore
pathB=backups/
#write this on the command line as the first parameter
filename=$1
#write your user
dbUser=$2
#write your database
database=postgres_db
#write your host
host=postgres
#write your port
port=5432

psql -U $dbUser -h $host -p $port -d $database -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
psql --set ON_ERROR_STOP=off -U $dbUser -h $host -p $port -d $database -1 -f $pathB$filename

unset PGPASSWORD
