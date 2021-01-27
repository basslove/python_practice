ARG IMAGE=python:3.7-alpine

# ######################
# base
FROM ${IMAGE} as base
ENV PYTHONUNBUFFERED=1

RUN apk --update add --no-cache git openssh bash

ARG APP_NAME

ENV WORK_DIR /${APP_NAME}/

WORKDIR ${WORK_DIR}
COPY Pipfile Pipfile.lock ./

# ######################
# development
FROM base as development

ARG APP_NAME

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

RUN apk update && \
    apk add --virtual bash gcc curl git openssl python3-dev musl-dev && \
    apk add --no-cache mariadb-dev && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --skip-lock --system

WORKDIR /${APP_NAME}/
COPY . /${APP_NAME}/