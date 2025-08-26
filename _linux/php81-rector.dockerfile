# ## BUILD
# $$ podmand build -t php81-rector .
#
# ## RUN
# $$ podman run -it --rm -v $PWD/d:/workdir php81-rector
# $$ podman run -it --rm -v $PWD/d:/workdir --entrypoint /bin/bash php81-rector  


# // BASED on: https://github.com/PHPExpertsInc/docker-rector/blob/master/docker/rector/Dockerfile

FROM php:8.1.33-apache-trixie

# Fix add-apt-repository is broken with non-UTF-8 locales, see https://github.com/oerdnj/deb.sury.org/issues/56
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive


ADD https://getcomposer.org/composer.phar /usr/local/bin/composer

RUN apt-get update && \

    # // Necessary for PHP Rector (and PhpSTAN)
    apt-get install -y --no-install-recommends \
        git \
        p7zip-full && \

    # Cleanup
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/* && \

    chmod +x /usr/local/bin/composer && \
    /usr/local/bin/composer global require 'rector/rector'

VOLUME ["/workdir"]
WORKDIR /workdir

ENTRYPOINT ["/root/.composer/vendor/bin/rector"]
