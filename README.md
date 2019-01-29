Sidecar container for restoring volumes backed up with restic-backup-sidecar.

## Build

```bash
docker build -t restic-restore-sidecar .
```

## Run

```bash
docker run -v /path/to/id_rsa:/restic/key --env-file ./environment.env restic-restore-sidecar
```

## Notes

When running in production, ssh key and `REPO_PASSWORD` should be provided by secrets, otherwise they might leak.