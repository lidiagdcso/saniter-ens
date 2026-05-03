# saniter-ens

Proyecto TFG — Adecuación al ENS Categoría MEDIA

## Adecuación al ENS Categoría MEDIA — Saniter

**TFG — ASIR Online** | Lidia Gallardo Díaz-Cacho | Tutor: Daniel Espinosa | 2026

---

## Descripción

Proyecto de adecuación de la infraestructura de Saniter (PYME sector sanidad ambiental)
al Esquema Nacional de Seguridad (ENS) Categoría MEDIA, según el RD 311/2022.
Infraestructura virtualizada en VirtualBox siguiendo el ciclo PDCA.

---

## Infraestructura

| Máquina       | SO                  | IP (ENS)  | Rol                    |
| ------------- | ------------------- | --------- | ---------------------- |
| SERVER-AD-01  | Windows Server 2022 | 10.0.0.20 | Controlador de Dominio |
| Ubuntu Server | Ubuntu 22.04 LTS    | 10.0.0.30 | Web + BBDD             |
| Kali Linux    | Kali 2025.4         | 10.0.0.10 | Auditor (OpenVAS)      |
| OPNsense      | OPNsense 26.1       | 10.0.0.1  | Firewall perimetral    |

---

## Estructura del repositorio

```
saniter-ens/
├── README.md                        # Este archivo
├── .gitignore                       # Exclusiones de seguridad
├── docs/                            # Memoria del TFG (PDF)
├── scripts/
│   ├── ubuntu/                      # Scripts de bastionado Ubuntu
│   └── windows/                     # Scripts PowerShell Windows
├── config/                          # Configuraciones de referencia
└── auditorias/
    ├── pre/                         # Informes XML pre-bastionado
    └── post/                        # Informes XML post-bastionado
```

---

## Controles ENS implementados

| Código      | Medida                       | Implementación                   |
| ----------- | ---------------------------- | -------------------------------- |
| [op.pl.1]   | Análisis de riesgos          | MAGERIT v3 — §4.1.4              |
| [op.acc.1]  | Identificación única         | AD + MariaDB usuarios por rol    |
| [op.acc.2]  | Mínimo privilegio            | GPOs + permisos BBDD             |
| [op.acc.4]  | Autenticación robusta        | GPO contraseñas + SSH hardening  |
| [op.net.1]  | Segregación de redes         | OPNsense WAN/LAN + UFW           |
| [op.vig.1]  | Detección de deficiencias    | OpenVAS pre y post bastionado    |
| [mp.com.1]  | Perímetro seguro             | OPNsense firewall + reglas       |
| [mp.s.1]    | Configuración segura inicial | Hardening Ubuntu y Windows       |
| [op.cont.2] | Copias de seguridad          | mysqldump + snapshots VirtualBox |

---

## Resultados de las auditorías

| Servidor       | Vulns. pre | Vulns. post | Reducción |
| -------------- | ---------- | ----------- | --------- |
| Ubuntu Server  | 5          | 2           | 60%       |
| Windows Server | 2          | 1           | 50%       |

---

## Licencia

Proyecto académico. Uso libre para fines educativos con atribución.
