Set-StrictMode -Version Latest

#Secured Creds
$cred = Get-Credential -Message "Enter Credentials"
New-PSDrive -Name "Z" -PSProvider FileSystem -Root "\\mlsredfs\Teams\v-bbuenarte" -Credential $cred -Persist

#Used for creating the file
$machineName = Read-Host "Enter name of machine"
New-Item -Path "Z:\RITM2438749\$machineName.txt" -ItemType File

#Show UUID and MAC
$uuidMacLines = @(
    (Get-CimInstance Win32_ComputerSystemProduct).UUID
    " "
    cmd.exe /c "wmic nic get Caption,MACAddress"
    )
Add-Content -Path "Z:\RITM2438749\$machineName.txt" -Value $uuidMacLines
