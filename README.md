<span style="background-color: #226f54; font-size: 125%; padding-top: 1.25%; padding-right: 2.5%; padding-bottom: 1.25%; padding-left: 2.5%; border-radius: 25px;">This project is active: new features are being developed, bugs are being fixed.</span>

# peony_starter

To run the starter as-is you need:

- a firebird server
```
docker run \
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
docker run \
  --rm \
  --detach \
  --name=redict \
  --publish=6379:6379 \
  registry.redict.io/redict
```

- a blobly server

```
git clone https://github.com/einar-hjortdal/blobly.git && \
cd blobly && \
v install && \
v run .
```
Note: blobly needs some environment variables set before starting