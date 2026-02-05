Set-StrictMode -Version Latest

<#
    Faster to go local, network wack
#>

$blackrockShared = "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\SP11XGA_11212025\"

$connectedDrives = (Read-Host "Enter drive letters (space separated)") -split '\s+'

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

