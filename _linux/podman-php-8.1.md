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
podman run -it --rm -v $PWD/d:/root $_PHP /bin/sh -c 'cd /root; php d/info.php'
```

### Run PhpSTAN

- Get version

```sh
wget https://github.com/phpstan/phpstan/releases/download/2.1.22/phpstan.phar -O ./d/phpstan.phar

podman run -it --rm -v $PWD/d:/root $_PHP /bin/sh -c "cd /root; php phpstan.phar --version" 
```

- Run PhpSTAN on a PHP project/repo...

> [!NOTE]
> > Fatal error: Allowed memory size of 134217728 bytes exhausted
> > (tried to allocate 135168 bytes) in phar:///root/phpstan.phar/vendor/nikic/php-parser/lib/PhpParser/Lexer.php on line 31
> >
> > PHPStan process crashed because it reached configured PHP memory limit: 128M
> 
> > Increase your memory limit in `php.ini` or run PHPStan with `--memory-limit` CLI option.
>
> - `--memory-limit`

```sh
_DIR=CakePHP-TALTAL

git clone --depth 1 https://github.com/nojimage/CakePHP-TALTAL ./d/$_DIR

podman run -it --rm -v $PWD/d:/root $_PHP /bin/sh -c "cd /root; php phpstan.phar analyse --memory-limit=190000000 $_DIR" 
```
