#!/bin/bash
# https://itnext.io/deploy-elastic-stack-on-kubernetes-1-15-using-helm-v3-9105653c7c8
NAME=$2
NS=log
CHART=${NAME}
#CHART=elastic/${NAME}
VERSION=v7.6.1
VALUES=${NAME}/values.yaml
RELEASE=$(helm ls | awk '{print $1}' | grep ${NAME})

display_usage() {
	echo -e "\nThis script must be run with 2 parameters"
	echo -e "\nUsage:\n$0 [install|update] [elasticsearch|kibana|metricbeat]"
	echo -e "\n Example:\n$0 install kibana \n"
	}

if [[  $# -le 1 ||  $# == "-h" ]]
then
  display_usage
  exit 1
fi


case $1 in
install)
		#helm install ${CHART} --namespace ${NS} -f ${VALUES} --version ${VERSION} --generate-name
     	#helm install --debug --dry-run ${NAME} --namespace ${NS} -f ${VALUES} --version ${VERSION} ${CHART}
		#helm install --debug --dry-run ${NAME} --namespace ${NS} -f ${VALUES} --version ${VERSION} ${CHART} > ${NAME}-debug.yaml
		helm install --debug ${NAME} --namespace ${NS} -f ${VALUES} --version ${VERSION} ${CHART} 
		#helm install --debug --dry-run --name ${NAME} --namespace ${NS} -f ${NAME}.yaml ${CHART} > ${NAME}-debug.yaml
		echo "Installed ${NAME}"
		;;
update)
		helm upgrade ${RELEASE} ${CHART} --namespace ${NS} -f ${VALUES} --version ${VERSION}
		echo "Updated ${NAME}"
		;;
*)
		display_usage
		;;
esac


