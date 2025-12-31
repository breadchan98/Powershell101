Set-StrictMode -Version Latest

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
