# show images in repo
$repo = invoke-webrequest https://mcr.microsoft.com/v2/mssql/server/tags/list
$repo.content



# check AzureRM module is installed
Get-Module -ListAvailable AzureRM



# log in to azure
Connect-AzureRmAccount



# get registry details
$Registry = Get-AzureRmContainerRegistry -ResourceGroupName "containers1" -Name "TestContainerRegistry01"



# get registry credentails
$RegistryCredential = Get-AzureRmContainerRegistryCredential `
    -ResourceGroupName "containers1" -Name "TestContainerRegistry01"



# log into registry
docker login $Registry.LoginServer -u $$RegistryCredential.Username -p $RegistryCredential.Password



# list local docker images
docker images



# build image
docker build -t testimage C:\git\dbafromthecold\ContainersInTheCloud\Code



# check images
docker images



# run container locally to confirm
docker run -d -p 15789:1433 `
    --env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122 `
        --name testcontainer testimage



# confirm container running
docker ps -a



# tag local image with ACR name
docker tag testimage TestContainerRegistry01.azurecr.io/devsqlimage:v4



# verify image
docker images



# push image to registry
docker push TestContainerRegistry01.azurecr.io/devsqlimage:v4



# view registry
Get-AzureRmContainerRegistry `
    -ResourceGroupName containers1 -Name TestContainerRegistry01 `
        -IncludeDetail



#clean up local
docker kill testcontainer
docker rm testcontainer
docker rmi TestContainerRegistry01.azurecr.io/devsqlimage:v4 testimage

