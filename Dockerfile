FROM malice/alpine:tini

MAINTAINER blacktop, https://github.com/blacktop

ENV GOSU_VERSION 1.9

RUN apk-install p7zip unrar python py-setuptools file unzip tar gzip bzip2
RUN apk-install -t .build-deps py-pip \
  && set -x \
  && echo "Install sflock..." \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel \
  && pip install https://github.com/jbremer/sflock/zipball/master \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps

WORKDIR /malware

ENTRYPOINT ["gosu","nobody","/sbin/tini","--","sflock"]

CMD ["--help"]
