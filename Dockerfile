FROM python:3.7.3-alpine3.9
LABEL maintainer="henry.rizzi@adops.com"

RUN apk add --no-cache musl \
build-base \
libffi-dev \
postgresql-dev

RUN pip3 install --upgrade pip \
luigi==2.8.11 \
psycopg2==2.8.4 \
SQLAlchemy==1.3.12 \
pyopenssl==19.1.0

ADD . /luigi-central
WORKDIR /luigi-central

EXPOSE 8082
ENTRYPOINT ["/luigi-central/warehouse-entry.sh"]
CMD luigid
