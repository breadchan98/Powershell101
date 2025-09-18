Set-StrictMode -Version Latest
Get-Content .\ascii.txt

#Secured Creds
$cred = Get-Credential -Message "Enter Credentials"

#custom share path
$networkPath = Read-Host "Enter drive path starting \\"
New-PSDrive -Name "Z" -PSProvider FileSystem -Root $networkPath -Credential $cred -Persist

#New Folder
$folderNewName = Read-Host "Enter RITM folder name"

if(Test-Path -Path "Z:\$folderNewName" -PathType Container) {
    Write-Host "Skipping as Folder $folderNewName exists"
}
else {
    New-Item -Path "Z:\$folderNewName" -ItemType Directory
}

#Used for creating the file
$machineName = Read-Host "Enter name of machine"
New-Item -Path "Z:\$folderNewName\$machineName.txt" -ItemType File

#Creating separate mac log for extracting
$ipAddress = cmd.exe /c "ipconfig /all"
New-Item -Path "Z:\$folderNewName\MAC logs\$machineName.MAC.txt" -ItemType File
Add-Content -Path "Z:\$folderNewName\MAC logs\$machineName.MAC.txt" -Value $ipAddress

#Finds pattern string
$macAddress = Get-Content "Z:\$folderNewName\MAC logs\$machineName.MAC.txt" | Select-String -Pattern "Physical","Description"

#Show UUID and MAC
$uuidMacLines = @(
    (Get-CimInstance Win32_ComputerSystemProduct).UUID
    " "
    $macAddress
    )
Add-Content -Path "Z:\$folderNewName\$machineName.txt" -Value $uuidMacLines

cmd.exe /c "net use Z: /delete"
