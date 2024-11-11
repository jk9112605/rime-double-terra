# Set GitHub repository ZIP file URL and download location
$repoUrl = "https://github.com/jk9112605/rime-double-terra/archive/refs/heads/main.zip"
$downloadZip = "$env:TEMP\rime-double-terra.zip"

# Set the path to the Rime user folder
$rimeUserFolder = "$env:APPDATA\Rime"

# Check if the Rime user folder exists
if (!(Test-Path -Path $rimeUserFolder)) {
    Write-Host "Rime user folder not found. Please install Rime first."
    exit
}

# Download the ZIP file
Write-Host "Downloading ZIP file..."
Invoke-WebRequest -Uri $repoUrl -OutFile $downloadZip

# Extract the ZIP file
$extractPath = "$env:TEMP\rime-double-terra"
Write-Host "Extracting ZIP file..."
Expand-Archive -Path $downloadZip -DestinationPath $extractPath -Force

# Copy files to the Rime user folder
Write-Host "Copying files to the Rime user folder..."
Copy-Item -Path "$extractPath\rime-double-terra-main\*" -Destination $rimeUserFolder -Recurse -Force

# Check and merge rime.lua content
$newRimeLuaPath = "$extractPath\rime-double-terra-main\rime.lua"
$existingRimeLuaPath = "$rimeUserFolder\rime.lua"

if (Test-Path -Path $existingRimeLuaPath) {
    Write-Host "Existing rime.lua file detected. Merging content..."

    # Read the new file content
    $newContent = Get-Content -Path $newRimeLuaPath -Raw

    # Check if the existing file already contains the new content
    $existingContent = Get-Content -Path $existingRimeLuaPath -Raw
    if ($existingContent -contains $newContent) {
        Write-Host "rime.lua already contains the new content. Skipping insertion."
    } else {
        Write-Host "Appending new content to the end of rime.lua."
        Add-Content -Path $existingRimeLuaPath -Value "`n$newContent"
    }
} else {
    Write-Host "No existing rime.lua file found. No need to merge rime.lua file."

}

# Clean up temporary files
Write-Host "Cleaning up temporary files..."
Remove-Item -Path $downloadZip -Force
Remove-Item -Path $extractPath -Recurse -Force

# Redeploy Rime
Write-Host "Redeploying Rime configuration..."

# Set folder paths
$weaselDir_x86 = "C:\Program Files (x86)\Rime"
$weaselDir_x64 = "C:\Program Files\Rime"
$deployer = $null

# Check x86 folder for WeaselDeployer.exe
$deployer = Get-ChildItem -Path "$weaselDir_x86\weasel-*" -Recurse -Filter "WeaselDeployer.exe" -ErrorAction SilentlyContinue | Select-Object -First 1

# If not found in x86 folder, check x64 folder
if (-not $deployer) {
    $deployer = Get-ChildItem -Path "$weaselDir_x64\weasel-*" -Recurse -Filter "WeaselDeployer.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
}

# Execute deployment if WeaselDeployer.exe is found
if ($deployer) {
    Write-Host "Running WeaselDeployer.exe for deployment..."
    & "$($deployer.FullName)" /deploy
} else {
    Write-Host "WeaselDeployer.exe not found in Rime installation directories."
}

Write-Host "Installation and redeployment complete! Please check your Rime configuration."