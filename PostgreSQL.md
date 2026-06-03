
These are the hurdles and commands that I always look up whenever I need to use PostgreSQL.

# Administration
## Bootstrap

Changing the linux user:

```bash
sudo -i -u postgres
```

check the current database:

```postgresql
SELECT current_database();
```

list all databases:

```postgresql
\list
```

list all users:

```postgresql
\du
```

or

```postgresql
\dg
```

## Users and Databases

create a user:

```postgresql
CREATE USER ilyas WITH PASSWORD 'secret';
```

changing a user's password:

```postgresql
ALTER USER ilyas WITH PASSWORD 'new_password';
```

grant permission:

```postgresql
ALTER USER ilyas CREATEDB;
```

grant superuser (carefully):

```postgresql
ALTER USER ilyas WITH SUPERUSER;
```

You can create a database:

```postgresql
CREATE DATABASE mydatabase;
```

You can drop a database if it doesn't exist:

```postgresql
DROP DATABASE IF EXISTS mydatabase;
```

## Connections and Authentication

connection command:

```bash
psql --host=localhost --port=5432 --username=user --dbname=mydatabase --command="SELECT 1;"
```

specify a password with:

```bash
PGPASSWORD='mypassword'
```

connect using a service:

```bash
psql service=my_service
```

define a service file `~/.pg_service.conf`

```INI
[my_service]
host=localhost
user=USER
dbname=NAME
port=5432

[mydb]
host=localhost
port=5432
dbname=blog
user=ilyas

[production]
host=db.example.com
port=5432
dbname=prod
user=admin
sslmode=require
```

define a password file `~/.pgpass`

```
hostname:port:database:username:password
```

on Unix systems:

```bash
chmod 600 ~/.pgpass
```

Otherwise PostgreSQL ignores the file for security reasons.

# User Commands

listing tables:

```postgresql
\dt
```