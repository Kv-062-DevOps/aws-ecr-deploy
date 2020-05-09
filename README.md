# aws-ecr-deploy 
Helm Charts to deploy services from the common Amazon Elastic Container Registry 

## DeliveryBot GitHub Action

Quick start DeliveryBot using:

1. Start the `kubernetes_add_service_account_kubeconfig.sh` script with parameters of service account name and namespace:  
`./deliverybot/kubernetes_add_service_account_kubeconfig.sh deliverybot default`  
2. Apply the `permissions.yaml` config:  
`kubectl apply -f permissions.yaml`  
3. Get secrets and copy all output:  
`cat /tmp/kube/k8s-deliverybot-default-conf`  
4. Put all this output in Secert in you Github Repository settings, save with name `KUBECONFIG`  

**More details about DeliveryBot GitHub Action install and use see at the DELIVERYBOT.MD:**  
https://github.com/Kv-062-DevOps/aws-ecr-deploy/blob/master/DELIVERYBOT.MD

**Pay attention:** With the DeliveryBot each microservices of our application are deploying from their ORIGINAL GitHub repositories! 
NOT from these charts. These charts are using only for manual deployment through `helm install ...` command.

### Application

**Frontend** 
[Kv-062-DevOps/aws-ecr-deploy/helm/front](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/front) 

**Backend and DataBase** 
[Kv-062-DevOps/aws-ecr-deploy/helm/back](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/back) 

**Get Service** 
[Kv-062-DevOps/aws-ecr-deploy/helm/get](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/get) 

**Post Service** 
[Kv-062-DevOps/aws-ecr-deploy/helm/post](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/post) 

### Infrastructure 

**ELK Stack**
[Kv-062-DevOps/aws-ecr-deploy/helm/elk](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/elk) 

**Prometheus and Grafana** 
[Kv-062-DevOps/aws-ecr-deploy/helm/prom-graf](https://github.com/Kv-062-DevOps/aws-ecr-deploy/tree/master/helm/prom-graf) 


 
