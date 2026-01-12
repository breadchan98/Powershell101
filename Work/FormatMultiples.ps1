Set-StrictMode -Version Latest

$connectedDrives = (Read-Host "Enter drive letters (space-separated)") -split '\s+'

$confirm = Read-Host "Format all drives? Type Y to Continue or press any key to skip"

if ($confirm -eq "N") {
    Write-Host "Stopping. Double check first."
    break
}
if ($confirm -eq "Y") {
    foreach ($drive in $connectedDrives) {
        Format-Volume -DriveLetter $drive -FileSystem FAT32 -NewFileSystemLabel BOOTME -Confirm:$true
    }
}