# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-WindowsExplorerOptions -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC
Set-TaskbarSmall

if (Test-PendingReboot) { Invoke-Reboot }

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Install Visual Studio 2013 Professional
cinst -y VisualStudio2013Professional -InstallArguments WebTools
if (Test-PendingReboot) { Invoke-Reboot }

# Visual Studio SDK required for PoshTools extension
cinst -y VS2013SDK
if (Test-PendingReboot) { Invoke-Reboot }

cinst -y dotnet4.5
if (Test-PendingReboot) { Invoke-Reboot }

# VS extensions
Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
Install-ChocolateyVsixPackage ProductivityPowerTools2013 https://visualstudiogallery.msdn.microsoft.com/dbcb8670-889e-4a54-a226-a48a15e4cace/file/117115/4/ProPowerTools.vsix
Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix
Install-ChocolateyVsixPackage VSCommandsForVisualStudio2013 https://visualstudiogallery.msdn.microsoft.com/c6d1c265-7007-405c-a68b-5606af238ece/file/106247/22/SquaredInfinity.VSCommands.VS12.vsix

#Other dev tools
cinst -y msysgit
cinst -y fiddler
cinst -y webpi
cinst -y atom
cinst -y nodejs
cinst -y linqpad4
cinst -y baretail

#Browsers
cinst -y google-chrome-x64

#Other essential tools
cinst -y filezilla
cinst -y sumatrapdf
cinst -y 7zip
cinst -y ccleaner
cinst -y sharpkeys
cinst -y putty
cinst -y winrar
cinst -y launchy
cinst -y dropbox
cinst -y rainmeter -pre
cinst -y speedfan

#Communication
cinst -y skype
cinst -y teamspeak -version 3.0.16

#Entertainment
cinst -y install steam
cinst -y plexmediaserver
cinst -y vlc
cinst -y spotify

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
