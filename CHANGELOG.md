# CHANGELOG

<!--- next entry here -->
## 1.0.2

### Changed
- Docker image downloads fixed release for ```minio``` server,
  2020-10-12T21-53-21Z. This fixes error on initialisation concerning
  unable to create alias for credentials.

## 1.0.1

### Changed
- Use MINIO_BUCKET environment variable to create the default bucket
- Docker image downloads fixed release for ```minio``` and ```mc`` commands
  these are **mc:** Release 2020-10-03T02-54-56Z and **minio:** Release 2020-10-03T02-19-42Z

### Fixed
- Newer releases of ```mc``` added policy to be set using ```mc policy set <policy>```

## 1.0.0
Released on GitHub Container Registry as dcs3spp/minio

## 0.0.1
2019-01-30

### Fixes

- add CI build for automated release management and using newer version of minio (b76649de9748f82cc113d08f45dddf56bfe79e05)
- fixed incorrect docker context patch (23bda2a4f518b726ab9ff863999a776b6ca79798)