# Laboratory LIMS Project - Prototype
This project runs a Python application connected to a PostgreSQL database inside a container environment. It is configured to automatically initialize your database tables.

## Project Structure
* `app.py` - Main Python application script.
* `init.sql` - Database initialization script.
* `docker-compose.yml` - Container multi-service setup file.
* `DME.md` - Setup and execution instructions.

## Prerequisites
Ensure your system has **one** of the following environment setups:
* **Option A (Debian/Ubuntu/Ubuntu-like)**: Docker & Docker Compose installed.
* **Option B (Oracle Linux/RedHat)**: Podman & Podman Compose installed.

---

## Setup for Debian / Ubuntu (Docker)
### 1. Start the Containers
```bash
docker-compose up -d
```
### 2. Enter the Database Session
```bash
docker exec -it healthcare_test_db psql -U lab_admin -d laboratory_lims
```

---

## Setup for Oracle Linux / RedHat (Podman)
### 1. Start the Containers
Podman reads your existing configuration file natively using its compose engine tool. Run:
```bash
podman-compose up -d
```
### 2. Enter the Database Session
Because Podman containers operate under user space names, locate your active container name using `podman ps` and run:
```bash
podman exec -it healthcare_test_db psql -U lab_admin -d laboratory_lims
```

---

## Shared Database Navigation Commands
Once inside the PostgreSQL database prompt (`laboratory_lims=#`), these commands work identically on both Docker and Podman:
* `\dt` - List all available tables (like the `sample_accession` table).
* `SELECT * FROM sample_accession;` - View all records inside the table.
* `\d sample_accession` - View the column names and data structure of the table.
* `\q` - Exit the database session and return to your standard terminal.

## How to Stop the Project
* **For Docker**: `docker-compose down`
* **For Podman**: `podman-compose down`

