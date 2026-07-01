#!/usr/bin/env python3
# coding: utf-8

import os
import shutil
from configparser import ConfigParser


def main():
    if os.getenv("PGPASSWORD"):
        pgpasswd = os.getenv("PGPASSWORD")

        config = ConfigParser()
        config.read_file(open("/luigi-central/luigi.cfg"))
        config["scheduler"]["record_task_history"] = "True"
        config["task_history"] = {}
        config["task_history"][
            "db_connection"
        ] = f"postgresql://etl_user:{pgpasswd}@schubert-pgbouncer:6432/warehouse"
        with open("/etc/luigi/luigi.cfg", "w") as cf:
            config.write(cf)
    else:
        shutil.copyfile("/luigi-central/luigi.cfg", "/etc/luigi/luigi.cfg")


if __name__ == "__main__":
    main()
