# peony_starter

To run the starter as-is you need:

- a firebird server
```
sudo docker run \
  --rm \
  --detach \
  --name=firebird-server \
  --env=FIREBIRD_ROOT_PASSWORD=rootpwd \
  --env=FIREBIRD_USER=fbusr \
  --env=FIREBIRD_PASSWORD=fbpwd \
  --env=FIREBIRD_DATABASE=firebird.fdb \
  --env=FIREBIRD_DATABASE_DEFAULT_CHARSET=UTF8 \
  --volume=firebird-data:/var/lib/firebird/data \
  --publish=3050:3050 \
  firebirdsql/firebird
```

- a redict server
```
sudo docker run \
  --rm \
  --detach \
  --name=redict \
  --publish=6379:6379 \
  registry.redict.io/redict
```

- a blobly service

Note: blobly needs some environment variables set before starting

```
git clone https://github.com/einar-hjortdal/blobly.git && \
cd blobly && \
v run .
```