# SQL Containers in the Cloud

---

## Andrew Pruski

### SQL Server DBA & Microsoft Data Platform MVP

@fa[twitter] @dbafromthecold <br>
@fa[envelope] dbafromthecold@gmail.com <br>
@fa[wordpress] www.dbafromthecold.com <br>
@fa[github] github.com/dbafromthecold

---

### Session Aim

To give an overview of the different options available to run SQL Server Docker containers in Azure

---

### Agenda

Azure Container Registry <br>
Azure Container Instances <br>
Azure Container Services

---

## Azure Container Registry

---

### Azure Container Registry

@size[0.6em](https://azure.microsoft.com/en-us/services/container-registry/)

<img src="assets/images/AzureContainerRegistry.png">

---

### Terminology

<b>Registry</b><br>
Service that stores container images<br>
<br>
<b>Repository</b><br>
Groups of container images – Same name, identified by tags<br>
	
---

### Features

<b>Encryption</b><br>
All images encrypted at rest<br>
<b>Geo-redundant storage</b><br>
Replication of images<br>
<b>Geo-replication</b><br>
Guards against total regional failure<br>
<b>ACR Build</b><br>
Container image build service<br>

---

### SKUs

---?code=assets/code/acr_login.azcli&lang=bash&title=ACR Login

<img src="assets/images/ACR-Login.png">

---?code=assets/code/acr_create_resource_group.azcli&lang=bash&title=Create Resource Group

<img src="assets/images/ACR-CreateResourceGroup.png">

---?code=assets/code/acr_create_registry.azcli&lang=bash&title=Create Registry

<img src="assets/images/ACR-CreateRegistry.png">

---?code=assets/code/acr_login_registry.azcli&lang=bash&title=Log into Registry

<img src="assets/images/ACR-LoginToRegistry.png">

---?code=assets/code/acr_get_registry_details.azcli&lang=bash&title=Get Registry Details

<img src="assets/images/ACR-GetRegistryDetails.png">

---?code=assets/code/dockerfile&lang=bash&title=Dockerfile

---?code=assets/code/acr_build_image.azcli&lang=bash&title=Build Container Image

<img src="assets/images/ACR-BuildImage.png">

---?code=assets/code/acr_tag_image.azcli&lang=bash&title=Tag Image

<img src="assets/images/ACR-TagImage.png">

---?code=assets/code/acr_push_image.azcli&lang=bash&title=Push Image

<img src="assets/images/ACR-PushImage.png">

---?code=assets/code/acr_list_repos.azcli&lang=bash&title=List Repositories

<img src="assets/images/ACR-ListRepos.png">

---?code=assets/code/acr_show_tags.azli&lang=bash&title=Show Tags

<img src="assets/images/ACR-ShowTags.png">

---?code=assets/code/acr_show_manifests.azcli&lang=bash&title=Show Manifests

<img src="assets/images/ACR-ShowManifests.png">

---

## Demo

---

## Azure Container Instances

---

### Azure Container Instances

@size[0.6em](https://azure.microsoft.com/en-us/services/container-instances/)

<img src="assets/images/AzureContainerInstances.png">

---

### Azure Container Instances

Running containers without servers <br>
No need to manage VMs <br>
Quick deployment <br>
Deployed via the CLI, powershell, or Azure Portal <br>
Billed by the second

---

### Options

Linux & Windows containers <br>
Containers exposed directly to the internet <br>
IP Address and FQDN <br>
Hypervisor level isolation <rb>
Persistent storage <br>
Azure files shares

---

### Container Groups

Similar in concept to K8s pods <br>
Multiple containers running on the same host <br>
Share IP address, containers exposed on ports <br>
Supports mounting external volumes

---?code=assets/code/aci_get_credentials.azcli&lang=bash&title=ACI - Get Credentials

@[1](Enable admin)
@[3](Show credentials)

---?code=assets/code/aci_create_keyvault.azcli&lang=bash&title=ACI - Create Keyvault

@[1](Create keyvault)
@[3-9](Create service principle and store password)
@[11-15](Store username)

---?code=assets/code/aci_create_container.azcli&lang=bash&title=ACI - Create Container

@[2](From custom image)
@[3](Specifying the resource group)
@[4-7](Retrieving the username stored in keyvault)
@[8-11](Retrieving the password stored in keyvault)
@[12](Setting the container name)
@[13](Specifying resources available to container)
@[14](Setting the required environment variables)
@[15](Specifying the IP address type)
@[16](Specifying the port to connect to)

---?code=assets/code/aci_get_container_status.azcli&lang=bash&ACI - Get Container Status

<img src="assets/images/ACI-GetContainerStatus.png">

---

### Connect to Azure Container Instance

<img src="assets/images/ACI-ConnectToContainer.png">

---

## Demo

---

## Azure Container Services

---

### Azure Container Services

@size[0.6em](https://azure.microsoft.com/en-us/services/container-service/)

<img src="assets/images/AzureContainerServices.png">

---

### Azure Container Services

Two flavours <br>
Azure Container Services (ACS) <br>
Azure Container Services (AKS) <br>
<br>
ACS provides container hosting using DC/OS, Swarm, or K8s <br>
AKS is specifically built to implement Kubernetes

---

### Kubernetes

<p align="left">
@size[0.6em](test text) <br>
@size[0.6em](test text) <br>
@size[0.6em](test text) <br>
@size[0.6em](test text) <br>
@size[0.6em](test text) <br>
</p>

<img src="assets/images/AKS-KubernetesLogo.png" style="float: right"/>

---

Open Source system for managing containers <br>
Deployed as a cluster containing a master and multiple nodes <br>
Pods hold containers running on the nodes <br>
Services define/allow access to sets of pods <br>
Deployments created and managed via Kubectl <br>

---

### Azure Container Services (AKS)

Simplifies deployment of Kubernetes clusters <br>
Cluster can be spun up with one line of code <br>
Applications deployed to cluster via yaml files <br>
Managed by Azure-CLI/powershell and kubectl <br>

---?code=assets/code/aks_create_cluster.azcli&lang=bash&title=Create Cluster

@[2](Specify the resource group)
@[3](Give the cluster a name)
@[4](Specify the number of nodes)
@[5](Generate keys so that we can connect)

<img src="assets/images/AKS-CreateCluster.png">

---?code=assets/code/aks_get_details.azcli&lang=bash&title=Get Cluster and ACR Details

@[1-4](Get cluster ID)
@[6-10](Get Azure Container Registry ID)

---?code=assets/code/aks_create_role.azcli&lang=bash&title=Create role to grant access

@[2](AKS Cluster ID)
@[4](Azure Container Registry ID)

---?code=assets/code/aks_yaml_file.yaml&lang=bash&title=AKS yaml file

---?code=assets/code/aks_deploy_to_cluster.azcli&lang=bash&title=Deploy to cluster

<img src="assets/images/AKS-DeployToCluster.png">

---?code=assets/code/aks_deployment_info.azcli&lang=bash&title=View deployment information

@[1](View deployments)
@[2](View nodes)
@[3](View services)

<img src="assets/images/AKS-DeploymentInformation.png">

---

### Connect to SQL Server

<img src="assets/images/AKS-ConnectToSqlServer.png">

---

### Kubernetes Dashboard

<img src="assets/images/AKS-KubernetesDashboard.png">

---

## Demo

---

### Resources

@size[0.6em](https://azure.microsoft.com/en-us/services/container-registry/) <br>
@size[0.6em](https://azure.microsoft.com/en-us/services/container-instances/) <br>
@size[0.6em](https://azure.microsoft.com/en-us/services/container-service/) <br>
@size[0.6em](https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/) <br>
@size[0.6em](https://github.com/dbafromthecold/ContainersInTheCloud)

---

<img src="assets/images/Questions.png" style="float: right;" size=medium border=none/>

</br>
</br>
</br>
</br>
### Questions?


