
To see the list of installed images

```sh
docker images
```

To see the of running containers:

```sh
docker ps
```

For stopped containers:

```sh
docker ps -a
```



Since you're currently in `~/a/penpot`, you can also verify that these containers belong to the Compose project with:

```bash
docker compose ps
```

And when you want to stop/start the whole Penpot stack:

```bash
docker compose stop
docker compose start
```

Or recreate/start everything:

```bash
docker compose up -d
```