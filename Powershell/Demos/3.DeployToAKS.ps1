# install AzureRM.aks with -AllowPrerelease (it's in preview - so expect weirdness!)
# this requires up-to-date versions of PowershellGet & Packagemanagement modules
Install-Module -Name AzureRM.Aks -AllowPrerelease



# import the module
Import-Module AzureRm.Aks



# get credentials to connect to cluster
Import-AzureRmAksCredential -ResourceGroupName containers1 -Name mySQLK8sCluster1



# confirm connection to cluster by viewing nodes
kubectl get nodes



# set location to .yml file
cd C:\Git\dbafromthecold\ContainersInTheCloud\Demos



# deploy to cluster
kubectl create -f sqlserver2.yml



# view deployment
kubectl get deployments



# view pods
kubectl get pods



# get more info
kubectl describe pods



# view service
kubectl get service



# remote into container
kubectl get pods
kubectl exec -it podname bash



# view dashboard
Start-AzureRmAksDashboard -ResourceGroupName containers1 -Name mySQLK8sCluster1



# get pods
kubectl get pods



# delete pod
kubectl delete pod podname



# get pods
kubectl get pods



# delete deployment & service
kubectl delete deployment sqlserver2
kubectl delete service sqlserver2-service



# confirm
kubectl get deployments
kubectl get pods
kubectl get service
