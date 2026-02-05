#!/bin/bash

FLAG_FILE="/usr/share/elasticsearch/flag.txt"

sudo systemctl restart elasticsearch.service kibana.service

if [ -f "$FLAG_FILE" ]; then
    echo "Kibana enrollment is already done (flag exists)"
    exit 0
fi

echo "Enrollment in progress.."

sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token --scope kibana > /usr/share/elasticsearch/el.token

sudo /usr/share/kibana/bin/kibana-setup --enrollment-token "$(cat /usr/share/elasticsearch/el.token)"

sudo rm -f /usr/share/elasticsearch/el.token


sudo systemctl restart elasticsearch.service kibana.service

sudo touch "$FLAG_FILE"
sudo chown root:root "$FLAG_FILE"
sudo chmod 600 "$FLAG_FILE"
