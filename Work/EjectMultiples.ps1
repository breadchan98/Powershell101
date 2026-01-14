Set-StrictMode -Version Latest


$connectedDrives = (Read-Host "Enter drive letters (space separated)") -split '\s+'

$confirm = Read-Host "Eject all drives? Type Y to Continue or press any key to skip"

#eject all plugged USB drives
if ($confirm -eq "N") {
    Write-Host "Stopping. Double check first."
    break
}
if ($confirm -eq "Y") {
    foreach ($drive in $connectedDrives) {
        $shell = New-Object -ComObject Shell.Application
        $driveL = $shell.Namespace(17).ParseName("${drive}:")

        #trigger the eject to WinExplorer
        $driveL.InvokeVerb('Eject')
    }
}
Write-Host "All drives were ejected."