# mysql-migrations-docker
A Docker image for automatically handling any new MySQL migrations.

## Configuration
This tool uses the standard MySQL environment variables for its configuration.

| Variable | Usage |
| --- | --- |
| `MYSQL_HOST` | The hostname to which the migrator will connect (TCP is forced). |
| `MYSQL_TCP_PORT` | The on which the TCP connection will be established. |
| `MYSQL_USER` | The MySQL user responsible for carrying out the migrations. |
| `MYSQL_PASSWORD` | The authentication password for the user provided above. |

## Usage
This image uses [**go-migrate**](https://github.com/golang-migrate/migrate) behind the scenes for running the migrations.

It will search through all files in the image's `/migrations` directory following the filename format `<number>_<name>.up.sql`
and execute them sequentially according to `number` ascending, while keeping track of which migrations have already been
executed internally.

The migrations are included on image build (see `./migrations`) but may also be replaced by volumes.
