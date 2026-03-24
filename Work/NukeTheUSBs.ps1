Set-StrictMode -Version Latest

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
<#
$confirm2 = Read-Host "Eject all drives? Type Y to Continue or press any key to skip"



#eject all plugged USB drives
if ($confirm2 -eq "N") {
    Write-Host "Stopping. Double check first."
    break
}
if ($confirm2 -eq "Y") {
    foreach ($drive in $connectedDrives) {
        $shell = New-Object -ComObject Shell.Application
        $driveL = $shell.Namespace(17).ParseName("${drive}:")

        #trigger the eject to WinExplorer
        $driveL.InvokeVerb('Eject')
    }
}
Write-Host "All drives were ejected."

#>