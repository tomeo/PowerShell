# List of components http://stackoverflow.com/questions/37892173/automating-installation-of-iis/37893187#37893187
# If script is running on Windows Server
if ((Get-WmiObject Win32_OperatingSystem).Name -like '*server*') {
	Write-Host "Identified host as Windows Server" -ForegroundColor Yellow
	Import-Module ServerManager
	# If this breaks because you don't have c:\sources\sxs you can't install Web-Asp-Net and Web-Net-Ext
	# In that case remove the -Source argument and those two components from the list
	Add-WindowsFeature -Source c:\sources\sxs -Name `
		Web-Server,
		Web-Http-Redirect,
		Web-Mgmt-Tools,
		Web-Scripting-Tools,
		Web-AppInit,
		Web-Request-Monitor,
		Web-Http-Tracing,
		Web-Dyn-Compression,
		Web-ISAPI-Ext,
		Web-ISAPI-Filter,
		Web-Asp-Net,
		Web-Net-Ext,
		Web-Asp-Net45,
		Web-Net-Ext45,
		Web-WebSockets
		`
    Add-WindowsFeature NET-HTTP-Activation
    Add-WindowsFeature NET-WCF-HTTP-Activation45
    Add-WindowsFeature NET-WCF-MSMQ-Activation45
    Add-WindowsFeature NET-WCF-Pipe-Activation45
    Add-WindowsFeature NET-WCF-TCP-Activation45
}
# If script is running on regular Windows
# This does not install NET 3.5
else {
	Write-Host "Identified host as Windows Standard" -ForegroundColor Yellow
	Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName `
		IIS-Webserver,
		IIS-HttpRedirect,
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
		IIS-RequestMonitor,
		IIS-WebSockets
		`

    Write-Host "Adding Windows features" -ForegroundColor Yellow
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-HTTP-Activation
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-HTTP-Activation45
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-TCP-Activation45
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-TCP-PortSharing45
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-Pipe-Activation45
    Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-MSMQ-Activation45
} 

Write-Host "Removing standard websites and application pools" -ForegroundColor Yellow
Try {
  Remove-Website "Default Web Site"
} Catch {}
Try {
  Remove-WebAppPool ".NET v2.0"
  Remove-WebAppPool ".NET v2.0 Classic"
  Remove-WebAppPool ".NET v4.5"
  Remove-WebAppPool ".NET v4.5 Classic"
  Remove-WebAppPool "Classic .NET AppPool"
  Remove-WebAppPool "DefaultAppPool"
} Catch {}

# List installed components
# Get-WindowsOptionalFeature -online | Where {$_.FeatureName -like 'IIS*'} | Sort FeatureName | Format-Table