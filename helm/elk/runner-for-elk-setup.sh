#!/bin/bash

NS=log

kubectl create ns ${NS}

PRODUCT=elasticsearch
./elk-setup.sh install ${PRODUCT}
#kubectl get pods --namespace=${NS} -l app=${PRODUCT}-master -w
kubectl get pods --namespace=log -l app=elasticsearch-master -w
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

PRODUCT=kibana
./elk-setup.sh install ${PRODUCT}
#kubectl get pods --namespace=${NS} -l app=${PRODUCT}-master -w
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

PRODUCT=metricbeat
./elk-setup.sh install ${PRODUCT}
#kubectl get pods --namespace=${NS} -l app=${PRODUCT}-master -w
kubectl get pods --namespace=log -l app=metricbeat-1589065690-metricbeat -w
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

PRODUCT=filebeat
./elk-setup.sh install ${PRODUCT}
#kubectl get pods --namespace=${NS} -l app=${PRODUCT}-master -w
kubectl get pods --namespace=log -l app=filebeat-1589065779-filebeat -w
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

kubectl port-forward svc/elasticsearch-master 9200

