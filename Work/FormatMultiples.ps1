Set-StrictMode -Version Latest

<<<<<<< HEAD
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
=======
<#
    What to do lol
    1. View drives
    2. Put number of plugged drives
    3. Enter number of internal hard drives
    4. Enter number of USB Drives
        4a. Enter starting letter, based on get-disk
    5. Format each one
        5a.Add target files to add into drives
#>

# Provides the plugged drives, view the number of drives and what are plugged
Get-Disk | 
    Where-Object {$_.BusType -eq 'USB'} | 
    Get-Partition | 
    Get-Volume | 
    Where-Object {$_.DriveLetter -ne $null}

$numOfExtDrives = Read-Host "Enter number of USB drives"
>>>>>>> 759bffa3825330ef0feea3f08f07215ad53ac982
