#!/bin/bash

NS=log

kubectl create ns ${NS}

PRODUCT=elasticsearch
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=${NS} -l app=${PRODUCT}-master
kubectl get all --namespace ${NS}

PRODUCT=kibana
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=${NS} -l app=${PRODUCT}
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

PRODUCT=filebeat
./elk-setup.sh install ${PRODUCT}
kubectl get pods --namespace=${NS} -l app=${PRODUCT}
helm test ${PRODUCT}
kubectl get all --namespace ${NS}

#PRODUCT=metricbeat
#./elk-setup.sh install ${PRODUCT}
#kubectl get pods --namespace=${NS} -l app=${PRODUCT} -w
#helm test ${PRODUCT}
#kubectl get all --namespace ${NS}

kubectl get all --namespace ${NS}


kubectl port-forward svc/elasticsearch-master 9200

