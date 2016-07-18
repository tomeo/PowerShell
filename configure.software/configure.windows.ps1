# Set pinned items
# Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-GameBarTips
Disable-UAC
Set-TaskbarOptions -Size Small -Lock -Dock Top -Combine Always
Install-WindowsUpdate -Full

# Edit registry
cd $PSScriptRoot
regedit /s ../reg/ChangeCapsLockToControl.reg

# Import Start Menu Layout (Export using Export-StartLayout -Path C:\StartMenuLayout.xml)
Import-StartLayout –LayoutPath $PSScriptRoot\..\xml\StartMenuLayout.xml -MountPath $env:SystemDrive\

# Set timezone
tzutil /s "W. Europe Standard Time"