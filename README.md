malice-zip (WIP)
================

[![Circle CI](https://circleci.com/gh/maliceio/malice-zip.png?style=shield)](https://circleci.com/gh/maliceio/malice-zip) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/malice/zip.svg)](https://hub.docker.com/r/malice/zip/) [![Docker Pulls](https://img.shields.io/docker/pulls/malice/zip.svg)](https://hub.docker.com/r/malice/zip/) [![Docker Image](https://img.shields.io/badge/docker image-61.84 MB-blue.svg)](https://hub.docker.com/r/malice/zip/)

Malice Zip/Compressed File Plugins

This repository contains a **Dockerfile** of the malice plugin **malice/zip**.

### Dependencies

-	[malice/alpine:tini](https://hub.docker.com/r/malice/alpine/)

### Installation

1.	Install [Docker](https://www.docker.io/).
2.	Download [trusted build](https://hub.docker.com/r/malice/zip/) from public [DockerHub](https://hub.docker.com): `docker pull malice/zip`

### Usage

```
docker run --rm -v /path/to/rules:/rules:ro malice/zip FILE
```

#### Or link your own malware folder

```bash
$ docker run -v /path/to/malware:/malware:ro -v /path/to/rules:/rules:ro malice/zip FILE

Usage: zip [OPTIONS] COMMAND [arg...]

Malice Zip Plugin

Version: v0.1.0, BuildTime: 20160214

Author:
  blacktop - <https://github.com/blacktop>

Options:
  --verbose, -V		verbose output
  --rethinkdb value	rethinkdb address for Malice to store results [$MALICE_RETHINKDB]
  --post, -p		POST results to Malice webhook [$MALICE_ENDPOINT]
  --proxy, -x		proxy settings for Malice webhook endpoint [$MALICE_PROXY]
  --table, -t		output as Markdown table
  --rules value		zip rules directory (default: "/rules")
  --help, -h		show help
  --version, -v		print the version

Commands:
  help	Shows a list of commands or help for one command

Run 'zip COMMAND --help' for more information on a command.
```

This will output to stdout and POST to malice results API webhook endpoint.

Sample Output
-------------

### JSON:

```json
{ "zip": { } }
```

### STDOUT (Markdown Table):

---

#### Zip

---

Documentation
-------------

### To write results to [ElasticSearch](https://www.elastic.co/products/elasticsearch)

```bash
$ docker volume create --name malice
$ docker run -d --name elastic \
                -p 9200:9200 \
                -v malice:/usr/share/elasticsearch/data \
                 blacktop/elasticsearch
$ docker run --rm --link elastic malice/zip FILE
```

### POST results to a webhook

```bash
$ docker run -v `pwd`:/malware:ro \
             -e MALICE_ENDPOINT="https://malice.io:31337/scan/file" \
             malice/zip --post evil.zip
```

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/maliceio/malice-zip/issues/new)

### CHANGELOG

See [`CHANGELOG.md`](https://github.com/maliceio/malice-zip/blob/master/CHANGELOG.md)

### Contributing

[See all contributors on GitHub](https://github.com/maliceio/malice-zip/graphs/contributors).

Please update the [CHANGELOG.md](https://github.com/maliceio/malice-zip/blob/master/CHANGELOG.md) and submit a [Pull Request on GitHub](https://help.github.com/articles/using-pull-requests/).

### Credits

> Uses Jurriaan Bremer's [sflock](https://github.com/jbremer/sflock) which has a [gplv3](https://github.com/jbremer/sflock/raw/master/docs/LICENSE) license.

### License

MIT Copyright (c) 2016 **blacktop**
