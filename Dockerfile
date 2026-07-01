FROM python:3.12
LABEL maintainer="henry.rizzi@adops.com"

RUN apt-get update && apt-get install -y libffi-dev \
libxml2-dev \
libxslt-dev && apt-get clean

COPY . /luigi-central
WORKDIR /luigi-central

RUN pip3 install --upgrade pip pipenv
RUN pipenv install --system

EXPOSE 8082
ENTRYPOINT ["/luigi-central/warehouse-entry.sh"]
CMD ["luigid"]
