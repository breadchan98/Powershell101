<#>
    ForEach Loops
    - Used for repeating a process, "iterating"
    - There are three methods to iterate using loops, per performance wise
#>

#Goal: Create folders and save via Shared Folders WITHOUT doing it manually

$pathName = "Basics/Loops Practice/FolderNameRequests.txt"
$targetPath = "Basics/Loops Practice/Shared Folders"

#This will treat the var as an array, can be used now for indexing
$folderNames = Get-Content -Path $pathName

<#
- New-Item -Path "target path" -Name arrayVar(ex: folderNames)[index] -ItemType Directory
#>

<#
Reference, the old way!

#Manual Way
New-Item -Path "$targetPath" -Name $folderNames[0] -ItemType Directory
New-Item -Path "$targetPath" -Name $folderNames[1] -ItemType Directory
New-Item -Path "$targetPath" -Name $folderNames[2] -ItemType Directory

#>

#Foreach Test Practice

############## THE FIRST METHOD #######################

#for each var (lines) in the folderNames (the content in pathName), it will print out each
foreach($line in $folderNames) {
    #if the path SharedFolders\name of user does not exist
    if((Test-Path -Path "$targetPath\$line") -eq $false) {
        #create new item on targetPath named $line
        New-Item -Path "$targetPath" -Name $line -ItemType Directory
    }
    else {
        Write-Output "This Folder Exist"
    }
}

############## THE SECOND METHOD #######################
<#
    For-Each Object Cmdlet and Pipeline
#>
$folderNames | ForEach-Object -Process {
    # $line to $_
    if((Test-Path -Path "$targetPath\$_") -eq $false) {
        #create new item on targetPath named $line
        New-Item -Path "$targetPath" -Name $_ -ItemType Directory
    }
    else {
        Write-Output "This Folder Exist"
    }
}