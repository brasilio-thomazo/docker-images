ARG UID=1000
ARG GID=1000
ARG USER=app
ARG GROUP=app
ARG HOME=/usr/share/app

FROM alpine:latest
ARG UID
ARG GID
ARG USER
ARG GROUP
ARG HOME
RUN apk add --no-cache doas icu-data-full tzdata musl-locales bash curl \
    && addgroup -g ${UID} ${GROUP} \
    && adduser -h ${HOME} -G ${GROUP} -u ${UID} -s /bin/bash -D ${USER} \
    && echo 'permit nopass :wheel' >> /etc/doas.d/doas.conf \
    && echo 'permit nopass ${USER} as root' >> /etc/doas.d/doas.conf