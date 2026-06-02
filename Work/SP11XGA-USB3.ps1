<#

    THIS IS FOR BRAND NEW DRIVES THAT HAVE NOT BEEN PARTITIONED

#>


Set-StrictMode -Version Latest


#Partition from 128GB to <32GB
$usbDrives = Get-Disk | Where-Object { 
    $_.BusType -eq 'USB' -and $_.PartitionStyle -ne 'RAW' -or $_.PartitionStyle -eq 'RAW' 
}
foreach ($disk in $usbDrives) {
    Write-Host "USB Drive Number: $($disk.Number)"

    # Wipe the disk
    Clear-Disk -Number $disk.Number -RemoveData -Confirm:$false
    Write-Host "Disk Number $($disk.Number) wiped."

    Initialize-Disk -Number $disk.Number -PartitionStyle MBR

    $partition = New-Partition -DiskNumber $disk.Number -Size 30000MB -AssignDriveLetter

    Format-Volume -Partition $partition -FileSystem FAT32 -NewFileSystemLabel "BOOTME" -Confirm:$true

    Write-Host "Disk Number $($disk.Number) cleaned and partitioned as BOOTME"

}

#Transfer XGA Files to Drives
$blackrockShared = "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Cadmus_USB_Network_Recovery_V4.2_NoWTT_SP11XGA_11212025\"

$connectedDrives = Get-Disk | Where-Object BusType -eq USB | Get-Partition | Where-Object DriveLetter | Select-Object -ExpandProperty DriveLetter

Write-Host "Transfering files to all drives"

$connectedDrives | ForEach-Object -Parallel {
    $destination = "$($_):\"
    Robocopy.exe $using:blackrockShared $destination /E /Z /R:1 /W:1 /MT:8
    Write-Host "Completed adding files to $destination"
}

#Ejecting all drives
foreach ($drive in $connectedDrives) {
    $shell = New-Object -ComObject Shell.Application
    $driveL = $shell.Namespace(17).ParseName("${drive}:")

    #trigger the eject to WinExplorer
    $driveL.InvokeVerb('Eject')
}