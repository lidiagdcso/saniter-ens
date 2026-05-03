# Reglas de Firewall OPNsense — Proyecto Saniter ENS

Control ENS: [op.net.1] Segregación de redes | [mp.com.1] Perímetro seguro

## Red interna: 10.0.0.0/24

| Acción | Interfaz | Protocolo | Origen    | Destino             | Descripción                     |
| ------ | -------- | --------- | --------- | ------------------- | ------------------------------- |
| Allow  | LAN      | TCP/UDP   | LAN net   | 10.0.0.20:53,88,389 | Servicios AD (DNS, Kerberos)    |
| Allow  | LAN      | TCP       | LAN net   | 10.0.0.30:80,443    | Acceso web servidor Ubuntu      |
| Allow  | LAN      | TCP       | 10.0.0.10 | LAN net: any        | Kali auditor - acceso completo  |
| Block  | LAN      | TCP       | LAN net   | 10.0.0.30:3306      | Bloquear acceso directo MariaDB |
| Block  | WAN      | TCP       | any       | 10.0.0.20:135       | Bloquear RPC desde exterior     |
| Allow  | WAN      | TCP       | any       | 10.0.0.30:80,443    | Acceso web público Saniter      |

## Notas

- Las reglas se aplican en orden. OPNsense evalúa de arriba a abajo.
- La regla Block WAN→135 mitiga la vulnerabilidad DCE/RPC (CVSS 5.0).
- En OPNsense se crean por puerto individual al no admitir múltiples puertos por regla.
