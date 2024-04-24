# Specify the directory path
$directoryPath = "C:\SysAdmin"

# Check if the directory exists
if (-not (Test-Path -Path $directoryPath -PathType Container)) {
    # Create the directory
    New-Item -Path $directoryPath -ItemType Directory
    Write-Host "Directory created at $directoryPath"
} else {
    Write-Host "Directory already exists at $directoryPath"
}
$url = "https://raw.githubusercontent.com/murtaza7869/PalmBeachCounty/main/InstallMU.reg"
$output = "C:\SysAdmin\InstallMU.reg"
$wc = new-object System.Net.WebClient
$wc.DownloadFile($url, $output)
Start-Process "regedit.exe" "/s '"C:\SysAdmin\InstallMU.reg"'" -NoNewWindow -Wait
