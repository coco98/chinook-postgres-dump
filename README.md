# chinook-postgres-dump

Schema of the chinook database:
http://schemaspy.org/sample/relationships.html

## Full dataset (requires `psql`)

To import:

```
psql postgres://user:pass@host:port/dbname < chinook_pg_serial_pk_proper_naming.sql
```


## Small dataset (can be run via `Run SQL` on the Hasura Console)

To import:
1. On the Hasura console add a postgres database as a source
2. Head to the `Run SQL` window
3. Copy the contents of `chinook-postgres-small.sql` and paste it into the SQL editor
4. Ensure that `Track tables` is not selected
5. Run the SQL!

Notes:
- This dataset only has the `artists`, `albums` and `tracks` tables with 10 artists, their associated albums and tracks.
