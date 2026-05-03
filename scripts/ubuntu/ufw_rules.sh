#!/bin/bash
# ============================================================
# ufw_rules.sh — Configuración del firewall UFW
# Proyecto: Adecuación ENS Categoría MEDIA — Saniter
# Control ENS: [op.net.1] [mp.com.1]
# Ejecutar como root: sudo bash ufw_rules.sh
# ============================================================
 
# Políticas por defecto
ufw default deny incoming
ufw default allow outgoing
 
# Permitir SSH en nuevo puerto
ufw allow 2222/tcp comment 'SSH bastionado'
 
# Permitir tráfico web
ufw allow 80/tcp comment 'HTTP Apache'
ufw allow 443/tcp comment 'HTTPS Apache'
 
# Bloquear acceso directo a MariaDB desde red
ufw deny 3306/tcp comment 'MariaDB - solo localhost'
 
# Activar firewall
ufw --force enable
 
# Verificar reglas
ufw status verbose
