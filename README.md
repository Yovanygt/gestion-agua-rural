# Base de Datos — Control Agua Rural

Repositorio correspondiente al desarrollo de la base de datos relacional del sistema **Control Agua Rural**.

La base de datos fue diseñada para administrar la información relacionada con la distribución de agua en comunidades rurales, permitiendo el manejo centralizado de usuarios, familias, incidencias, consumo, mantenimiento y reportes del sistema.

---

# Objetivo

Diseñar e implementar una base de datos relacional centralizada utilizando PostgreSQL, capaz de soportar múltiples usuarios conectados simultáneamente mediante una arquitectura cliente-servidor.

---

# Tecnologías Utilizadas

- PostgreSQL 18
- pgAdmin 4
- SQL
- GitHub
- Radmin VPN

---

# Características de la Base de Datos

La base de datos permite:

- Gestión de usuarios y roles
- Registro de familias
- Administración de sectores
- Monitoreo de niveles de agua
- Registro de consumo
- Programación de distribución
- Gestión de incidencias
- Control de mantenimiento
- Generación de alertas
- Historial y auditoría
- Soporte multiusuario mediante VPN

---

# Arquitectura de Conexión

```text
Clientes
   ↓
Radmin VPN
   ↓
Servidor PostgreSQL
