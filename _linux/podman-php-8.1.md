## PHP 8.1

Docker Hub: https://hub.docker.com/_/php/tags?name=8.1.33

- `php:8.1.33-apache-trixie`

    - [Linux/amd64](https://hub.docker.com/layers/library/php/8.1.33-apache/images/sha256-ce98364f1d82899ea8cf7b0f4400f44dc78af08c5a0134fcc22f04d8af5a5673)


### Pull

```sh
_PHP=php:8.1.33-apache-trixie

podman pull $_PHP
```

### Hello

```sh
podman run -it --rm $_PHP /bin/sh -c 'php --version'
```

```sh
podman run -it --rm -v $PWD:/root $_PHP /bin/sh -c 'php /root/info.php'
```
