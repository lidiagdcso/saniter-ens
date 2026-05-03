#!/bin/bash
#!/bin/bash
# ============================================================
# backup_saniter.sh — Copia de seguridad automatizada BBDD
# Proyecto: Adecuación ENS Categoría MEDIA — Saniter
# Control ENS: [op.cont.2] [mp.info.6]
# Programar en crontab: 0 2 * * * /opt/backups/backup_saniter.sh
# ============================================================

DATE=$(date +%Y%m%d_%H%M%S)
# Volcado de la base de datos
mysqldump -u root –skip-password saniter_db > /opt/backups/saniter/saniter_db_$DATE.sql

#Eliminación de backups de más de 30 días
find /opt/backups/saniter -name '*.sql' -mtime +30 -delete

#Registro en log
echo 'Backup completado: '$DATE >> /var/log/backup_saniter.log
