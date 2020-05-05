SEE DeliveryBot examples:  
https://github.com/deliverybot/example  
https://github.com/deliverybot/example-helm  
Main parameters and info on the official page:  
https://deliverybot.dev/docs/integrations/action-helm/  

DO:  
1. Visit web page and click INSTALL application:  
https://github.com/apps/deliverybot  
Grant access for Deliverybot to your github account.  

After that you can find it and configure in you Github:  
https://github.com/settings/installations  
Apply DeliveryBot only for repositories that you need.  

2. Setup your own Kubernetes cluster.  

3. Create a service account for GitHub actions to have access to your cluster as described here:  
https://gist.github.com/innovia/fbba8259042f71db98ea8d4ad19bd708  
a) save shell script:  
https://gist.github.com/innovia/fbba8259042f71db98ea8d4ad19bd708#file-kubernetes_add_service_account_kubeconfig-sh  
b) edit!  
Find `base64 -D` twice, and replace `base64 -d` or `base64 --decode`  
c) check that you have installed "jq" utility, or install it:  
`sudo apt-get install jq`  
d) start this script with parameters of service account name and namespace. For example:  
`./kubernetes_add_service_account_kubeconfig.sh deliverybot default`  
e) create the file with name `permissions.yaml`, that consists:  
```
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: deliverybot-clusterrolebinding
subjects:
  - kind: ServiceAccount
    name: deliverybot
    namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: ""
```
f) apply the permission:  
`kubectl apply -f permissions.yaml`  

g) test it with command:  
`KUBECONFIG=/tmp/kube/k8s-deliverybot-default-conf kubectl get pods`

h) get secrets and copy all output:  
`cat /tmp/kube/k8s-mydeliverybotjqd-default-conf`  
Put all this output in Secert in you Github Repository settings, save with name `KUBECONFIG`  

4. Create and configure the structure of GitHub action:  
```
config/                   # Contains value files per environment.
.github/workflows/cd.yml  # GitHub action workflow.
.github/deploy.yml        # Deliverybot configuration file.
```
5. Deploy your application to your cluster by push :-)  






