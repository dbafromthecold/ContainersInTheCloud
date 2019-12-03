# install AzureRM.aks with -AllowPrerelease (it's in preview - so expect weirdness!)
# this requires up-to-date versions of PowershellGet & Packagemanagement modules
Install-Module -Name AzureRM.Aks -AllowPrerelease



# import the module
Import-Module AzureRm.Aks



# log in to azure
Connect-AzureRmAccount



# create kubernetes cluster (with 2 nodes)
New-AzureRmAks -ResourceGroupName containers1 -Name mySQLK8sCluster1 -NodeCount 2



# install kubectl
az aks install-cli



# get credentials to connect to cluster
Import-AzureRmAksCredential -ResourceGroupName containers1 -Name mySQLK8sCluster1



# confirm connection to cluster by viewing nodes
kubectl get nodes



# get AKS client ID
$Aks = Get-AzureRmResource -ResourceGroupName containers1 `
  -ResourceType Microsoft.ContainerService/managedClusters `
    -ResourceName mySQLK8sCluster1 -ApiVersion 2018-03-31
$ClientId = $Aks.properties.servicePrincipalProfile.clientId



# get ACR ID
$Acr = Get-AzureRmContainerRegistry -ResourceGroupName containers1 -Name TestContainerRegistry01 
$ResourceId = $Acr.id



# create role to allow deployments
New-AzureRmRoleAssignment -ApplicationId $ClientId -RoleDefinitionName "Reader" -Scope $ResourceId



# deploy to cluster (confirm yaml file location)
kubectl create -f sqlserver.yml



# view deployment
kubectl get deployments



# view pods
kubectl get pods



# view service
kubectl get service



# view dashboard
Start-AzureRmAksDashboard -ResourceGroupName containers1 -Name mySQLK8sCluster1