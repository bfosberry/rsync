rsync
=====

Simple rsync server running in a docker container

This is based off of https://github.com/nabeken/docker-volume-container-rsync with a few modifications. That project provides a volume for a docker mount, where as this provides just a simple, unauthenticated rsync server.

This is meant to be a temporary, disposable rsync storage. Do NOT use for backups. 

## Usage

Launch the container via docker:
```
docker run -d -p 873 bfosberry/rsync
```

You can connect to rsync server inside a container like this:

```sh
$ rsync rsync://<docker>:<port>/
data          data directory
```

To sync:

```sh
$ rsync -avP /path/to/dir rsync://<docker>:<port>/data/
```

## Advanced

In default, rsync server accepts a connection only from `192.168.0.0/16` and `172.12.0.0/12` for security reasons.
You can override via an environment variable like this:

```sh
$ docker run -d -p 873 -e ALLOW='10.0.0.0/8 x.x.x.x/y' bfosberry/rsync
```
