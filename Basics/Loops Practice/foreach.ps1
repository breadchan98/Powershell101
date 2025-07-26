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

New-Item -Path "$targetPath" -Name $folderNames[0] -ItemType Directory
