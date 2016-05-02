#!/bin/sh

if [ -f /secret/env ]; then
    set -a
    source /secret/env
else
    mkdir -p /secret
    printenv > /secret/env
fi

mkdir -p /etc/luigi
mv /oao-warehouse-etl/luigi-interface-logger.ini /etc/luigi/luigi-interface-logger.ini

python3 /oao-warehouse-etl/config-setup.py

# Create and set perms on log file, then start tailing it, so docker logs/ fluentd gets via STDOUT
touch /tmp/luigi-interface.log
chmod 777 /tmp/luigi-interface.log
ln -s /tmp/luigi-interface.log /oao-warehouse-etl/log
tail -f /tmp/luigi-interface.log &

exec $@
