# check AzureRM module is installed
Get-Module -ListAvailable AzureRM



# log in to azure
Connect-AzureRmAccount



# list registries under resource group
Get-AzureRmContainerRegistry -ResourceGroupName containers1 -Name TestContainerRegistry01



# get credentials
$RegistryCredential = Get-AzureRmContainerRegistryCredential `
    -ResourceGroupName "containers1" -Name "TestContainerRegistry01"



# create pscredential
$SecPasswd = ConvertTo-SecureString $RegistryCredential.Password -AsPlainText -Force
$PsCred = New-Object System.Management.Automation.PSCredential($RegistryCredential.Username, $SecPasswd)



# create environment variable hash table and add values
$envs = @{}
$envs.add("ACCEPT_EULA","Y")
$envs.add("SA_PASSWORD","Testing1122")



# create container
New-AzureRmContainerGroup `
    -ResourceGroupName containers1 `
    -Name testcontainer1 `
    -Image testcontainerregistry01.azurecr.io/devsqlimage:latest `
    -RegistryCredential $PsCred `
    -Cpu 2 `
    -MemoryInGB 4 `
    -IpAddressType public `
    -Port 1433 `
    -EnvironmentVariable $envs



# confirm container created
Get-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer1



# get container logs
Get-AzureRmContainerInstanceLog -ResourceGroupName containers1 -ContainerGroupName testcontainer1



# delete container
Remove-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer1
