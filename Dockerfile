FROM alpine:latest

RUN apk add --update \
    bash \
    git \
    texlive-full

RUN apk add --update \
    texmf-dist \
        texmf-dist-formatsextra \
        texmf-dist-latexextra \
        texmf-dist-pictures \
        texmf-dist-science

RUN apk add --no-cache poppler-utils
RUN apk add --no-cache msttcorefonts-installer && update-ms-fonts 2>&1 && fc-cache -f

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

RUN mkdir /var/workdir && chown www-data:www-data /var/workdir
ENV exports /exports
RUN mkdir ${exports}
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY latex2png.sh /
RUN chmod +x /latex2png.sh

USER www-data
WORKDIR /var/workdir

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
