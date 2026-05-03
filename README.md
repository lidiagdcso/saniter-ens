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
