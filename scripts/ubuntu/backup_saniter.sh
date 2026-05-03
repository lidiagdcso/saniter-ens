#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
mysqldump -u root –skip-password saniter_db > /opt/backups/saniter/saniter_db_$DATE.sql
find /opt/backups/saniter -name '*.sql' -mtime +30 -delete
echo 'Backup completado: '$DATE >> /var/log/backup_saniter.log
