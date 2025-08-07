Set-StrictMode -Version Latest

#Used for creating the file
$machineName = Read-Host "Enter name of machine"
New-Item -Path "C:\Users\bred-pc\Desktop\Work\Data\$machineName.txt" -ItemType File

#Creating separate mac log for extracting
$ipAddress = cmd.exe /c "ipconfig /all"
New-Item -Path "Z:\RITM2438749\MAC logs\$machineName.MAC.txt" -ItemType File
Add-Content -Path "Z:\RITM2438749\MAC logs\$machineName.MAC.txt" -Value $ipAddress

#Finds pattern string
$macAddress = Get-Content "Z:RITM2438749\MAC logs\$machineName.MAC.txt" | Select-String -Pattern "Physical","Description"

#Show UUID and MAC
$uuidMacLines = @(
    (Get-CimInstance Win32_ComputerSystemProduct).UUID
    " "
    $macAddress
    )
Add-Content -Path "Z:\RITM2438749\$machineName.txt" -Value $uuidMacLines

cmd.exe /c "net use Z: /delete"