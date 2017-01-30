FROM malice/alpine

LABEL maintainer "https://github.com/blacktop"

RUN apk --update add --no-cache p7zip unrar python py-setuptools file unzip tar gzip bzip2 py-pip \
  && echo "===> Install sflock..." \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel \
  && pip install https://github.com/jbremer/sflock/zipball/master \
  && rm -rf /tmp/* \
  && apk del --purge py-pip

WORKDIR /malware

ENTRYPOINT ["su-exec","nobody","/sbin/tini","--","sflock"]
CMD ["--help"]
