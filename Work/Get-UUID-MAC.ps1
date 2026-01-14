Set-StrictMode -Version Latest

#Secured Creds
$cred = Get-Credential -Message "Enter Credentials"
$driveLetter = Read-Host "Enter Drive Letter"
New-PSDrive -Name "$driveLetter" -PSProvider FileSystem -Root "\\MLS037SVC00\mlsredfs01\Shares\Teams\B37 Site Services\Brent\" -Credential $cred -Persist

#Enter RITM Number
$ritmNum = Read-Host "Enter RITM number"
$directoryPath = "${driveLetter}:\$ritmNum"
#RITM Number place holder

#if Directory exists
if(Test-Path $directoryPath) {
    Write-Output "$directoryPath exists" 
}
else {
    New-Item -Path $directoryPath -ItemType Directory
}

#Used for creating the file
$machineName = Read-Host "Enter name of machine"
New-Item -Path "$directoryPath\$machineName.txt" -ItemType File

#Create MAC Log Order
$macLogDir = "${driveLetter}:\$ritmNum\MAC logs"
if(Test-Path $macLogDir) {
    Write-Output "$macLogDir exists"
}
else {
    New-Item -Path $macLogDir -ItemType Directory
}

#Creating separate mac log for extracting
$ipAddress = cmd.exe /c "ipconfig /all"
New-Item -Path "$directoryPath\MAC logs\$machineName.MAC.txt" -ItemType File
Add-Content -Path "$directoryPath\MAC logs\$machineName.MAC.txt" -Value $ipAddress

#Finds pattern string
$macAddress = Get-Content "$directoryPath\MAC logs\$machineName.MAC.txt" | Select-String -Pattern "Physical","Description"

#Show UUID and MAC
$uuidMacLines = @(
    (Get-CimInstance Win32_ComputerSystemProduct).UUID
    " "
    $macAddress
    )
Add-Content -Path "$directoryPath\$machineName.txt" -Value $uuidMacLines

cmd.exe /c "net use ${driveletter}: /delete"
