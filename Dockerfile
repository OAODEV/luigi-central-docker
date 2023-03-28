FROM python:3
LABEL maintainer="henry.rizzi@adops.com"

RUN apt-get update && apt-get install -y libffi-dev \
libxml2-dev \
libxslt-dev && apt-get clean

RUN pip3 install --upgrade pip \
luigi==3.0.3 \
psycopg2==2.9.1 \
SQLAlchemy==1.4.25 \
pyopenssl==21.0.0

COPY . /luigi-central
WORKDIR /luigi-central

EXPOSE 8082
ENTRYPOINT ["/luigi-central/warehouse-entry.sh"]
CMD luigid
