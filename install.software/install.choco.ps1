# Set Execution Policy to Remote signed to allow execution of Powershell scripts (Must be run before install Chocolatey)
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Register chocolatey as package source
Register-PackageSource -Name chocolatey -Location http://chocolatey.org/api/v2 -Provider PowerShellGet -Trusted -Force