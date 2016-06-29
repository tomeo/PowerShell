# List of components http://stackoverflow.com/questions/37892173/automating-installation-of-iis/37893187#37893187
# If script is running on Windows Server
if ((Get-WmiObject Win32_OperatingSystem).Name -like '*server*') {
	Write-Host "Identified host as Windows Server"
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
}
# If script is running on regular Windows
# This does not install NET 3.5
else {
	Write-Host "Identified host as Windows Standard"
	Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName `
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
}

# List installed components
Get-WindowsOptionalFeature -online | Where {$_.FeatureName -like 'IIS*'} | Sort FeatureName | Format-Table
