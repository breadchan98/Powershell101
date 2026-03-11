Set-StrictMode -Version Latest

$viewUsbdrives = Get-Disk | Where-Object {
    $_.BusType -eq 'USB'-and $_.OperationalStatus -eq 'Online'
} | Sort-Object Number

Write-Host $viewUsbdrives

Write-Host "`nDetected USB disks:" -ForegroundColor Cyan
$viewUsbdrives | Format-Table Number, FriendlyName, Size, PartitionStyle, OperationalStatus -AutoSize
