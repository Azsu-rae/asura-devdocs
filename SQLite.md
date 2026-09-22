
In the SQLite CLI, the simplest way is:

```sql
.tables
```

That lists all tables in the current database.

If you want a SQL query instead:

```sql
SELECT name
FROM sqlite_master
WHERE type = 'table';
```

Or, excluding SQLite's internal tables:

```sql
SELECT name
FROM sqlite_master
WHERE type = 'table'
  AND name NOT LIKE 'sqlite_%';
```

You can also use the newer `sqlite_schema` name, which is equivalent:

```sql
SELECT name
FROM sqlite_schema
WHERE type = 'table';
```

If you're using **Java/JDBC**, you can retrieve them through `DatabaseMetaData` as well.