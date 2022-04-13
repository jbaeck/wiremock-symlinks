FROM wiremock/wiremock:latest-alpine

RUN apk update && apk upgrade --no-cache && apk add --no-cache wget

WORKDIR /home/wiremock-symlink

COPY setup/scripts/run.sh /run.sh
COPY setup/scripts/wiremock/mappings/ mappings/99-IMAGE
COPY setup/scripts/wiremock/__files/ __files/static

RUN mkdir -p /var/wiremock/extensions && \
    mkdir -p /home/wiremock-symlink/mount-target &&\
    chmod go=u -R /var/wiremock/extensions && \
    chmod go=u -R /home/wiremock-symlink && \
    chmod +x /run.sh

EXPOSE 5005

ENTRYPOINT ["/run.sh"]
