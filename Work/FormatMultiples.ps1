Set-StrictMode -Version Latest

$cred = Get-Credential -Message "Enter Credentials"
$driveLetter = Read-Host "Enter Drive Letter for Network Path"
New-PSDrive -Name "$driveLetter" -PSProvider FileSystem -Root "//path/source" -Credential $cred -Persist

$connectedDrives = (Read-Host "Enter drive letters (comma-separated") -split '\s+'

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
