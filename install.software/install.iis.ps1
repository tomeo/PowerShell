#List of components http://stackoverflow.com/questions/37892173/automating-installation-of-iis/37893187#37893187
# If script is running on Windows Server
if ((Get-WmiObject Win32_OperatingSystem).Name -like '*server*') {
  #Import-Module ServerManager
  #Add-WindowsFeature -Name Web-Server
}
# If script is running on regular Windows
else {
  Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName `
    IIS-Webserver,
    IIS-ApplicationDevelopment,
    IIS-ApplicationInit,
    IIS-ISAPIExtensions,
    IIS-ISAPIFilter,
    IIS-NetFxExtensibility,
    IIS-ASPNET,
    IIS-NetFxExtensibility45,
    IIS-ASPNET45,
    IIS-Performance,
    IIS-HttpCompressionStatic,
    IIS-HttpCompressionDynamic,
    IIS-WebServerManagementTools,
    IIS-ManagementConsole,
    IIS-ManagementScriptingTools,
    IIS-HealthAndDiagnostics,
    IIS-HttpTracing,
    IIS-RequestMonitor
    `
}
