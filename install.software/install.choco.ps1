# Set Execution Policy to Remote signed to allow execution of Powershell scripts (Must be run before install Chocolatey)
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Register chocolatey as package source
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco install -y msysgit