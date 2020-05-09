#!/bin/bash

NS=log

helm uninstall filebeat-1589065779 --namespace ${NS}
helm uninstall metricbeat-1589065690 --namespace ${NS}
helm uninstall kibana-1589065558 --namespace ${NS}
helm uninstall elasticsearch-1589065379 --namespace ${NS}

kubectl get all --namespace ${NS}

