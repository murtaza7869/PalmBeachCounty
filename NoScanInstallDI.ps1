# Define variables
$installerUrl = "https://mylibrary.pbclibrary.org/DeepInstinct3650/InstallerManaged_deep5.0.0.11.exe"
$exeFile = "$env:TEMP\InstallerManaged_deep5.0.0.11.exe"
$installPath = "C:\Program Files\DeepInstinct"
$commandLineArgs = "pbc.customers.deepinstinctweb.com /token 4936109d-863f-4892-ba15-df270810d945"

# Function to download the file
Function Download-File {
    param (
        [string]$url,
        [string]$outputFile
    )
    Write-Output "Downloading file from $url to $outputFile..."
    Invoke-WebRequest -Uri $url -OutFile $outputFile
}

# Download the installer file
Download-File -url $installerUrl -outputFile $exeFile

# Execute the installer with the specified command line arguments
Write-Output "Executing the installer..."
Start-Process -FilePath $exeFile -ArgumentList $commandLineArgs -Wait

# Wait for 3 minutes
Write-Output "Waiting for 3 minutes..."
Start-Sleep -Seconds 180

# Check if the installation path exists
if (Test-Path $installPath) {
    Write-Output "DeepInstinct seems to have installed as the Program files path exists"
} else {
    Write-Output "Installation might have failed, as the Program files path does not exist"
}

# Cleanup
Remove-Item -Path $exeFile -Force
