Set-StrictMode -Version Latest

$cred = Get-Credential -Message "Enter Credentials"
$driveLetter = Read-Host "Enter Drive Letter for Network Path"
New-PSDrive -Name "$driveLetter" -PSProvider FileSystem -Root "\\sesdfs\1windows\TestContent\CORE\Base\ES\Ops\ScoreEdge\Devices\Surface\SP11\Configure\DevOS\Staging\Cadmus_USB_Network_Recovery_V4.2_NoWTT_SP11XGA_01052026" -Credential $cred -Persist

$connectedDrives = (Read-Host "Enter drive letters (comma-separated") -split '\s+'

foreach ($drive in $connectedDrives) {
    $confirm = Read-Host "Format Drive $drive':? Type Y to Continue"
    if ($confirm -eq "Y") {
        Format-Volume -DriveLetter $drive -FileSystem FAT32 -NewFileSystemLabel BOOTME -Confirm:$true
    }
    else {
        Write-Host "Skipping drive $drive`:"
    }
}

while($true) {
    $formatDrive = Read-Host "Enter USB drive letter to format and add drive. Type N if done"
    if ($formatDrive -eq 'N') {
        break
    }
    else {
        Format-Volume -DriveLetter $formatDrive -FileSystem FAT32 -NewFileSystemLabel BOOTME -Confirm:$true
        $source = "${driveLetter}:\"
        $target = "${formatDrive}:\"
        robocopy $source $target  /E
    }
}
