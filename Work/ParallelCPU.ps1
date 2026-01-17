Set-StrictMode -Version Latest

<#
Practice Parallel CPU usages
$_ = current pipeline
#>

#Microsoft Learn
1..5 | ForEach-Object -Parallel { "Hello $_"; sleep 2; } -ThrottleLimit 5 

#Test
$folderNames = @(
    'Brent',
    'Mary',
    'Fortnite'
)
$folderNames | ForEach-Object -Parallel {
    New-Item -Path '.\Work\Test' -Name $_ -ItemType File
    sleep 1;
} -ThrottleLimit 3

#Test with UserInput
$connectedDrives = (Read-Host "Enter drive letters (space separated)") -split '\s+'

$connectedDrives | ForEach-Object -Parallel {
    New-Item -Path '.\Work\Test' -Name "$_.txt" -ItemType File
    Add-Content -Path ".\Work\Test\$_.txt" -Value "hello"
    Start-Sleep 1;
} -ThrottleLimit 3

#Format multiple drives at once
$driveNames = @(
    'E',
    'F',
    'G'
)
$driveNames | ForEach-Object -Parallel {
    Format-Volume -DriveLetter $_ -FileSystem FAT32 -NewFileSystemLabel BOOTME -Confirm:$true
    Start-Sleep 1;
} -ThrottleLimit 3