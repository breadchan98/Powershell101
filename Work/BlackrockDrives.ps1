Set-StrictMode -Version Latest

#Secured Creds
$cred = Get-Credential -Message "Enter Credentials"
$driveLetter = Read-Host "Enter Drive Letter"
New-PSDrive -Name "$driveLetter" -PSProvider FileSystem -Root "\\MLS037SVC00\mlsredfs01\Shares\Teams\B37 Site Services\Brent\" -Credential $cred -Persist

$connectedDrives = (Read-Host "Enter drive letters (space separated)") -split '\s+'

$connectedDrives | ForEach-Object -Parallel {
    New-Item -Path '.\Work\Test' -Name "$_.txt" -ItemType File
    Add-Content -Path ".\Work\Test\$_.txt" -Value "hello"
    Start-Sleep 1;
} -ThrottleLimit 3