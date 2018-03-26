FROM python:3.6.2-alpine3.6
LABEL maintainer="thomas.yager-madden@adops.com"

RUN apk add --no-cache musl \
build-base \
libffi-dev \
postgresql-dev

RUN pip3 install --upgrade pip \
luigi==2.7.1 \
psycopg2==2.7.3.1 \
SQLAlchemy==1.1.5 \
pyopenssl==17.2.0

ADD . /luigi-central
WORKDIR /luigi-central

EXPOSE 8082
ENTRYPOINT ["/luigi-central/warehouse-entry.sh"]
CMD luigid
