FROM buildpack-deps:jessie
MAINTAINER The Dockbit Team "team@dockbit.com"

ARG RELEASE=master

ENV HOME /root
ENV MIX_ENV prod
ENV PORT 4000
ENV REPLACE_OS_VARS true

ENV APP_ROOT /opt/app
ENV APP_NAME dockbit_phoenix_example

RUN mkdir -p ${APP_ROOT}

RUN wget --quiet https://s3.amazonaws.com/dockbitexamples-elixir-phoenix/releases/${RELEASE}.tar.gz && \
    tar -xf ${RELEASE}.tar.gz -C ${APP_ROOT} && \
    rm -rf ${RELEASE}.tar.gz && \
    chmod 550 ${APP_ROOT}/bin/${APP_NAME}

WORKDIR ${APP_ROOT}

EXPOSE $PORT

ENTRYPOINT ["bin/dockbit_phoenix_example", "foreground"]
