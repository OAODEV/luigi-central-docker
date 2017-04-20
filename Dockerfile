FROM python:3-alpine
MAINTAINER thomas.yager-madden@adops.com

RUN apk update && \
apk add --update musl \
build-base \
libffi-dev \
postgresql-dev

RUN pip3 install --upgrade pip \
luigi==2.6.1 \
psycopg2==2.6.2 \
requests==2.12.5 \
SQLAlchemy==1.1.5 \
pyopenssl==16.2.0

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD . /oao-warehouse-etl
WORKDIR /oao-warehouse-etl

EXPOSE 8082
ENTRYPOINT ["/oao-warehouse-etl/warehouse-entry.sh"]
CMD luigid
