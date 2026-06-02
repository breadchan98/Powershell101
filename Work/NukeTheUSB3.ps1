Set-StrictMode -Version Latest

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
