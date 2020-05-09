#!/bin/bash

NS=log

helm uninstall filebeat
helm uninstall metricbeat
helm uninstall kibana
helm uninstall elasticsearch

