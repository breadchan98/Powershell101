Set-StrictMode -Version Latest

$cred = Get-Credential -Message "Enter Credentials"
$driveLetter = Read-Host "Enter Drive Letter for Network Path"
New-PSDrive -Name "$driveLetter" -PSProvider FileSystem -Root "\\sesdfs\1windows\TestContent\CORE\Base\ES\Ops\ScoreEdge\Devices\Surface\SP11\Configure\DevOS\Staging\Cadmus_USB_Network_Recovery_V4.2_NoWTT_SP11XGA_01052026" -Credential $cred -Persist

#provide driver letter of USB drives
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

#start formatting
while($true) {
    $formatDrive = Read-Host "Ready to add files to drives? Type Y to continue or N to not"
    if ($formatDrive -eq 'N') {
        break
    }
    if ($formatDrive -eq 'Y') {
        foreach ($driveL in $connectedDrives) {
            $source = "${driveLetter}:\"
            $target = "${driveL}:\"
            robocopy $source $target /E
        }
    }
}