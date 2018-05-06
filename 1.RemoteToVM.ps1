Get-Service winrm

Start-Service winrm

winrm s winrm/config/client '@{TrustedHosts="*"}'

Enter-PSSession -computername 52.151.30.217 -Credential local\andrew

Get-Service docker

docker version

docker images

# & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon

exit
