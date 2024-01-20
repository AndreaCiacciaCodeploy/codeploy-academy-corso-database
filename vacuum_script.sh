#!/bin/bash

export PGPASSWORD=''

HOST=$1
DATABASEUSER=$2
DATABASENAME=$3
SCHEMA=$4
 
space_used=`psql -h $HOST -U $DATABASEUSER -d $DATABASENAME -c "select schemaname as table_schema, relname as table_name, pg_size_pretty(pg_relation_size(relid)) as data_size from pg_catalog.pg_statio_user_tables where schemaname = '$SCHEMA' order by pg_relation_size(relid) desc"`

if [ -z $HOST ] || [ -z $DATABASENAME ] || [ -z $DATABASEUSER ] || [ -z $SCHEMA ]; then
  echo "USAGE: ./$(basename $0) host db_user db_name db_schema"
  exit 1
fi

echo "Space used pre vacuum: "
echo "$space_used"
 
for tablename in $(psql -h $HOST -U $DATABASEUSER -d $DATABASENAME -t -c "select table_schema||'.'||table_name as _table from information_schema.tables where table_schema = '$SCHEMA' and table_type ='BASE TABLE'"); do
  echo $tablename
  psql -h $HOST -U $DATABASEUSER -d $DATABASENAME -c "vacuum full analyze ${tablename}"
done

space_used=`psql -h $HOST -U $DATABASEUSER -d $DATABASENAME -c "select schemaname as table_schema, relname as table_name, pg_size_pretty(pg_relation_size(relid)) as data_size from pg_catalog.pg_statio_user_tables where schemaname = '$SCHEMA' order by pg_relation_size(relid) desc"`

echo "Space used after vacuum: "
echo "$space_used"

Lo script deve essere lanciato con i seguenti parametri:

./script.sh <host_endpoint> <db_username> <db_name> <db_schema>
