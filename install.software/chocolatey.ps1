# install chocolatey
Set-ExecutionPolicy Bypass
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# install apps
cinst -y msysgit
cinst -y fiddler
cinst -y webpi
cinst -y atom
cinst -y nodejs
cinst -y linqpad4
cinst -y baretail

cinst -y google-chrome-x64

cinst -y skype
cinst -y teamspeak -version 3.0.16

cinst -y install steam
cinst -y plexmediaserver
cinst -y vlc
cinst -y spotify

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
