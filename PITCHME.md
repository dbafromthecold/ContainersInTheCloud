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

---?code=assets/code/acr_login_registry.azcli&lang=bash&title=Log into Registry


---


---



---

@title[Questions]

<img src="assets/images/Questions.png" style="float: right;" size=medium border=none/>

</br>
</br>
</br>
</br>
## Questions


