# Bitwarden/Vaultwarden Sync

**Backup & restore your Bitwarden/Vaultwarden vault between two servers.**

## Requirements

- **Personal API Keys**: [How to get them](https://bitwarden.com/help/personal-api-key/)
- **Does not currently support** Organizations or multi-user vaults
- Intended for **personal**, **self-hosted**, or **test** environments

## Docker

**Docker Hub**: [gabrielecabrini/bitwarden-sync](https://hub.docker.com/r/gabrielecabrini/bitwarden-sync)

**Example**: [docker-compose.yml](https://github.com/gabrielecabrini/bitwarden-sync/blob/main/docker-compose.yml)

## Features

- Automatically backs up the vault from a source Bitwarden server
- Purges all items from the destination vault
- Restores data into the destination vault
- Backups are encrypted and compressed using AES-256
- Backups are stored in the `backups/` folder with a timestamped filename

## How It Works

1. **Backs up** the vault from the source server
2. **Encrypts** the backup as a `.tar.gz.enc` file
3. **Purges** all data in the destination vault
4. **Restores** the backup to the destination server

## Environment Variables

| Variable                 | Description                                                                   |
|--------------------------|-------------------------------------------------------------------------------|
| `BW_CLIENTID_SOURCE`     | Bitwarden Client ID for the **source** server                                 |
| `BW_CLIENTSECRET_SOURCE` | Bitwarden Client Secret for the **source** server                             |
| `BW_ACCOUNT_SOURCE`      | Bitwarden account email for the source server (e.g., `user@example.com`)      |
| `BW_PASS_SOURCE`         | Vault password for the source server                                          |
| `BW_SERVER_SOURCE`       | URL of the **source** Bitwarden/Vaultwarden server                            |
| `BW_CLIENTID_DEST`       | Bitwarden Client ID for the **destination** server                            |
| `BW_CLIENTSECRET_DEST`   | Bitwarden Client Secret for the **destination** server                        |
| `BW_ACCOUNT_DEST`        | Bitwarden account email for the destination server (e.g., `user@example.com`) |
| `BW_PASS_DEST`           | Vault password for the destination server                                     |
| `BW_SERVER_DEST`         | URL of the **destination** Bitwarden/Vaultwarden server                       |
| `BW_TAR_PASS`            | Password used to encrypt/decrypt the `.tar.gz.enc` backup files               |

## Automatic Cleanup

Backups older than **30 days** are automatically deleted from the `/app/backups` folder.

---
