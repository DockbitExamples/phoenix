FROM buildpack-deps:jessie
MAINTAINER The Dockbit Team "team@dockbit.com"

ENV HOME /root
ENV MIX_ENV prod
ENV PORT 4000
ENV REPLACE_OS_VARS true

ENV APP_ROOT /opt/app
ENV APP_NAME dockbit_phoenix_example

RUN mkdir -p ${APP_ROOT}

ADD $APP_NAME.tar.gz ${APP_ROOT}

WORKDIR ${APP_ROOT}

EXPOSE $PORT

ENTRYPOINT ["${APP_ROOT}/bin/${APP_NAME}"]
