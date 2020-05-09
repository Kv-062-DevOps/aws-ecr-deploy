#!/bin/bash

PRODUCT = elasticsearch
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=default -l app=${PRODUCT}-master -w
helm test elasticsearch

PRODUCT = kibana
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=default -l app=${PRODUCT}-master -w3
helm test ${PRODUCT}

PRODUCT = metricbeat
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=default -l app=${PRODUCT}-master -w
helm test metricbeat

PRODUCT = filebeat
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=default -l app=${PRODUCT}-master -w
helm test ${PRODUCT}

kubectl port-forward svc/elasticsearch-master 9200

