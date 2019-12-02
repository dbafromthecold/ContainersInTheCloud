# check AzureRM module is installed
Get-Module -ListAvailable AzureRM



# log in to azure
Connect-AzureRmAccount



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
    -Name testcontainer2 `
    -Image testcontainerregistry01.azurecr.io/devsqlimage:latest `
    -RegistryCredential $PsCred `
    -Cpu 2 `
    -MemoryInGB 4 `
    -IpAddressType public `
    -Port 1433 `
    -EnvironmentVariable $envs
						


# confirm container created
Get-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer2



# have a look at the other container
Get-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer1



# confirm container created
Get-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer2



# get container logs
Get-AzureRmContainerInstanceLog --ResourceGroupName containers1 -ContainerGroupName testcontainers2



# delete container
Remove-AzureRmContainerGroup -ResourceGroupName containers1 -Name testcontainer1

