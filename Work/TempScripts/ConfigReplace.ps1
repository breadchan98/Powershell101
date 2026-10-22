Set-StrictMode -Version Latest

<#
    Faster to go local, network wack
#>

$configFile = "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\SP11_ConfigFile_Update\CONFIG.txt"

#get all USB drive letters
$connectedDrives = Get-Disk | Where-Object BusType -eq USB | Get-Partition | Where-Object DriveLetter | Select-Object -ExpandProperty DriveLetter

$connectedDrives | ForEach-Object -Parallel {
    Remove-Item "$($_):\CONFIG.txt"
}

foreach ($drive in $connectedDrives) {
    $destination = "$drive`:\"
    Copy-Item -Path $configFile -Destination $destination -Force
    Write-Host "Completed adding files to $destination"
}

