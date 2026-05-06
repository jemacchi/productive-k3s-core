# Parámetros De Scripts

Esta página resume las principales opciones CLI y parámetros respaldados por entorno que exponen los scripts del repositorio.

## `scripts/bootstrap-k3s-stack.sh`

### Opciones CLI

| Opción | Significado |
| --- | --- |
| `--dry-run` | Planificar el bootstrap sin aplicar cambios |
| `--mode <single-node|server|agent|stack>` | Elegir el modo de ejecución |
| `-h`, `--help` | Mostrar ayuda CLI |

### Inputs sensibles al modo

El bootstrap es mayormente interactivo. El script pregunta distintos valores según el estado detectado y el modo seleccionado.

Valores preguntados habitualmente:

- `Agent server URL`
- `Agent cluster token`
- `Base domain`
- `Rancher hostname`
- `Rancher bootstrap password`
- `Registry hostname`
- `Registry PVC size`
- `Registry StorageClass`
- `Registry auth enabled`, username y password
- elección de TLS: `Let's Encrypt` o `Self-signed`
- `Let's Encrypt email`
- `Let's Encrypt environment`
- `Longhorn data mount path`
- `Longhorn default replica count`
- `Longhorn storage minimal available percentage`
- `NFS export path`
- `NFS allowed client network/CIDR`
- si debe administrar `/etc/hosts` local
- si debe confiar el registry self-signed dentro del Docker local

### Variables de entorno relacionadas con telemetría

El script de bootstrap lee estas variables de entorno:

- `TELEMETRY_ENABLED`
- `TELEMETRY_ENDPOINT`
- `TELEMETRY_MAX_RETRIES`
- `TELEMETRY_CONNECT_TIMEOUT_SECONDS`
- `TELEMETRY_REQUEST_TIMEOUT_SECONDS`
- `TELEMETRY_OUTBOX_DIR`
- `TELEMETRY_USER_AGENT`

### Settings persistidos en el manifest

El manifest de bootstrap registra settings como:

- `bootstrap_mode`
- `agent_server_url_provided`
- `agent_cluster_token_provided`
- `base_domain`
- `rancher_host`
- `registry_host`
- `tls_mode`
- `letsencrypt_environment`
- `longhorn_data_path`
- `longhorn_replica_count`
- `longhorn_minimal_available_percentage`
- `longhorn_single_node_mode`
- `registry_pvc_size`
- `registry_storage_class`
- `registry_auth_enabled`
- `nfs_manage`
- `nfs_export_path`
- `nfs_allowed_network`
- `manage_local_hosts`
- `trust_registry_in_docker`

## `scripts/validate-k3s-stack.sh`

### Opciones CLI

| Opción | Significado |
| --- | --- |
| `--strict` | Terminar con código no cero también ante warnings |
| `--json` | Emitir JSON machine-readable |
| `--docker-registry-test` | Ejecutar validación docker push/pull contra `registry.home.arpa` |
| `-h`, `--help` | Mostrar ayuda CLI |

### Variables de entorno relacionadas

Para el camino opcional de Docker login, el validador puede consumir:

- `REGISTRY_USER`
- `REGISTRY_PASSWORD`

## `scripts/clean-k3s-stack.sh`

### Opciones CLI

| Opción | Significado |
| --- | --- |
| `--plan` | Mostrar sólo el plan de limpieza |
| `--apply` | Aplicar la limpieza destructiva |
| `--yes` | Auto-aprobar el prompt yes/no |
| `--confirm-clean` | Auto-aprobar la confirmación tipeada `CLEAN` |
| `-h`, `--help` | Mostrar ayuda CLI |

## `scripts/rollback-k3s-stack.sh`

### Opciones CLI

| Opción | Significado |
| --- | --- |
| `--to <file>` | Manifest JSON de una corrida de bootstrap a evaluar |
| `--plan` | Mostrar sólo el plan de rollback |
| `--apply` | Ejecutar acciones seguras de rollback derivadas del manifest |
| `--yes` | Auto-aprobar el apply sin prompting |
| `-h`, `--help` | Mostrar ayuda CLI |

## `scripts/send-telemetry.sh`

Este helper consume:

- `MANIFEST_PATH` posicional
- `TELEMETRY_ENDPOINT`
- `TELEMETRY_MAX_RETRIES`
- `TELEMETRY_CONNECT_TIMEOUT_SECONDS`
- `TELEMETRY_REQUEST_TIMEOUT_SECONDS`
- `TELEMETRY_OUTBOX_DIR`
- `TELEMETRY_USER_AGENT`
- `TELEMETRY_ENABLED`
- `TELEMETRY_RUN_ID`
- `TELEMETRY_SOURCE_REPOSITORY`
- `TELEMETRY_SOURCE_SCRIPT`
- `TELEMETRY_EXIT_CODE`

## Notas

!!! note
    El script de bootstrap es intencionalmente interactivo. La mayoría de las decisiones de instalación se piden en runtime en lugar de exponerse como una superficie enorme de flags.

!!! note
    Si necesitás orquestación automatizada, la separación por modos más los settings registrados en el manifest son hoy los puntos de integración más estables.
