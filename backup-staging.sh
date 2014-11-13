#!/bin/bash

###
# Script to get extra MySQL DB backup.
# Run this script every 30min:
#
#    0,30 * * * *		~/bin/backup-staging.sh
###

DB_NAME=mydb_staging
DB_USER=myuser_staging
DB_HOST="127.0.0.1"
DB_PASS="mydbpassword"
BACKUP_DIR=~/storage/backup_staging

NOW=$(date +"%Y%m%d_%H%M")
BACKUP_DB_FILENAME="${NOW}_${DB_NAME}.sql.gz"

mkdir -p $BACKUP_DIR

echo "backuping $DB_NAME ..."
mysqldump --host=$DB_HOST --user=$DB_USER --password=$DB_PASS $DB_NAME | gzip -c > $BACKUP_DIR/$BACKUP_DB_FILENAME

# cleanup: only keep backup files for 3 days
find $BACKUP_DIR -type f -mtime +2 -exec rm {} \;
