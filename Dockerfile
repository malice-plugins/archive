FROM malice/alpine

LABEL maintainer "https://github.com/blacktop"

# Install decompression tools
RUN apk --update add --no-cache p7zip unrar file cabextract unzip tar gzip bzip2
# Install python deps
RUN apk --update add --no-cache python py-setuptools
# Install sflock
RUN apk --update add --no-cache -t .build-dep py-pip gcc g++ make libffi-dev openssl-dev python-dev \
  && echo "===> Install sflock..." \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel \
  && pip install https://github.com/jbremer/sflock/zipball/master \
  && rm -rf /tmp/* \
  && apk del --purge .build-dep

WORKDIR /malware

ENTRYPOINT ["su-exec","nobody","/sbin/tini","--","sflock"]
CMD ["--help"]
