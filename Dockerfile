FROM alpine:latest
RUN apk update && apk add bash py3-pip
RUN /usr/bin/pip install mkdocs mkdocs-material mkdocs-static-i18n mkdocs-material-extensions mkdocs-minify-plugin mkdocs-markdownextradata-plugin https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

