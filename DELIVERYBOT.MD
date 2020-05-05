### See DeliveryBot example:  
https://github.com/deliverybot/example-helm  
Main parameters and info on the official page:  
https://deliverybot.dev/docs/integrations/action-helm/  

### 1. Visit web page and click INSTALL application:  
https://github.com/apps/deliverybot  
Grant access for Deliverybot to your github account.  

After that you can find it and configure in you Github:  
https://github.com/settings/installations  
Apply DeliveryBot only for repositories that you need.  

All your installations and settings for repositories will be here:  
https://app.deliverybot.dev/  
_https://raw.githubusercontent.com/Kv-062-DevOps/aws-ecr-deploy/master/deliverybot/choose_deploy_type.jpg_  

### 2. Setup your own Kubernetes cluster.  

### 3. Create a service account for GitHub actions to have access to your cluster:  
a) save shell script `kubernetes_add_service_account_kubeconfig.sh`:  
https://github.com/Kv-062-DevOps/aws-ecr-deploy/blob/master/deliverybot/kubernetes_add_service_account_kubeconfig.sh  

b) check that you have installed "jq" utility, or install it:  
`sudo apt-get install jq`  

c) start this script with parameters of service account name and namespace. For example:  
`./kubernetes_add_service_account_kubeconfig.sh deliverybot default`  

e) save the ynl file `permissions.yaml`:  
https://github.com/Kv-062-DevOps/aws-ecr-deploy/blob/master/deliverybot/permissions.yaml  

f) apply the permission:  
`kubectl apply -f permissions.yaml`  

g) test it with command:  
`KUBECONFIG=/tmp/kube/k8s-deliverybot-default-conf kubectl get pods`

h) get secrets and copy all output:  
`cat /tmp/kube/k8s-mydeliverybotjqd-default-conf`  
Put all this output in Secert in you Github Repository settings, save with name `KUBECONFIG`  

### 4. Create and configure the structure of GitHub action:  
```
config/                   # Contains value files per environment.
.github/workflows/cd.yml  # GitHub action workflow.
.github/deploy.yml        # Deliverybot configuration file.
```
### 5. Deploy your application to your cluster by push :-)  
