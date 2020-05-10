#!/bin/bash

NS=log

kubectl get all --namespace ${NS}

DEPLOYED=elasticsearch
helm uninstall ${DEPLOYED} --namespace ${NS}

DEPLOYED=kibana
helm uninstall ${DEPLOYED} --namespace ${NS}

DEPLOYED=filebeat
helm uninstall ${DEPLOYED} --namespace ${NS}

#DEPLOYED=metricbeat
#helm uninstall ${DEPLOYED} --namespace ${NS}

kubectl get all --namespace ${NS}

