Set-StrictMode -Version Latest

<#
    Faster to go local, network wack
#>

$blackrockShared = "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\SL7_Intel\USBv4_Network_Recovery_NoWTT_SL7\"

#get all USB drive letters
$connectedDrives = Get-Disk | Where-Object BusType -eq USB | Get-Partition | Where-Object DriveLetter | Select-Object -ExpandProperty DriveLetter

$confirm = Read-Host "Format all drives? Type Y to Continue or press any key to skip"

#formats all plugged USB drives
if ($confirm -eq "N") {
    Write-Host "Stopping. Double check first."
    break
}
if ($confirm -eq "Y") {
    foreach ($drive in $connectedDrives) {
        Format-Volume -DriveLetter $drive -FileSystem FAT32 -NewFileSystemLabel BOOTME -Confirm:$true
    }
}

Write-Host "All drives were formatted."

$connectedDrives | ForEach-Object -Parallel {
    $destination = "$($_):\"
    Robocopy.exe $using:blackrockShared $destination /E /Z /R:1 /W:1 /MT:8
    Write-Host "Completed adding files to $destination"
}

