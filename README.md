# dbAccess 26.x.y.z

Imagem Docker para execução do **TOTVS dbAccess** (build 26.1.0.0) em ambiente containerizado.

## Descrição

Este projeto monta uma imagem Docker dbAccess 26.x.y.z sobre Oracle Linux 9. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

### Características

- **Base:** Oracle Linux 9
- **Drivers ODBC:** psqlODBC 18 (`postgresql18-odbc`, repositório PGDG) e Microsoft ODBC Driver 18 for SQL Server
- **dbAccess:** build 26.1.0.0, porta TCP 7890 (default)
- **Configuração dinâmica:** Banco de dados, usuário e senha definidos via variáveis de ambiente `PROTHEUS_DB`, `PROTHEUS_USER` e `PROTHEUS_PASSWORD`

## Pré-requisitos

- Docker (com BuildKit habilitado para build)

## Build

```bash
# Build local das tags de versão
make build
```

## Publicação da imagem

```bash
# Build e push das tags de versão
make release

# Incluir também a tag latest
make release_latest
```

Gera as tags:

- `feliperaposo/protheus-dbaccess:26`
- `feliperaposo/protheus-dbaccess:26.1.0.0`
- `feliperaposo/protheus-dbaccess:latest`

## Estrutura interna (referência)

- **Entrypoint:** `/dbaccess.sh`
- **Binários:** `/dbaccess/multi/dbaccess64`, `/dbaccess/library/dbaccess64.so`
- **Configuração:** `/dbaccess/multi/dbaccess.ini` (parâmetros `{{PROTHEUS_DB}}`, `{{PROTHEUS_USER}}` e `{{PROTHEUS_PASSWORD}}` substituídos em runtime)

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
