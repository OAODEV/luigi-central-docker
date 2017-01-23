FROM alpine
MAINTAINER thomas.yager-madden@adops.com

RUN apk update && \
apk add --update musl \
python3 \
python3-dev \
build-base \
libffi-dev \
postgresql-dev \
git

RUN pip3 install --upgrade pip \
git+https://github.com/spotify/luigi.git \
psycopg2 \
requests \
SQLAlchemy \
pyopenssl

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD . /oao-warehouse-etl
WORKDIR /oao-warehouse-etl

EXPOSE 8082
ENTRYPOINT ["/oao-warehouse-etl/warehouse-entry.sh"]
CMD luigid
