<#
    Conditional Statements = if, elseif, else
    - They do not use symbols for operators, but more like abbrev
    - adding a letter 'c' in the beginning will make an operator case-sensitive
#>

#Examples below
1 -eq 2 # ==
1 -ne 2 # !=
1 -lt 2 # <
1 -le 2 # <=
1 -gt 2 # >
1 -ge 2 # >=

# -contains is a boolean return, not case-sensitive
@(4,8,12,16) -contains 4 #returns a boolean True
@('Test','test') -contains 'TEST' #this will return True

# -ccontains makes it case-sensitive
@('Test','test') -ccontains 'TEST'

#This is for extra example use of conditional (file path is under linux dir)
$pathFile = "/home/bred/Desktop/PowerShell101/Powershell101/Basics/Data Reading/test.txt"
Test-Path -Path $pathFile

# Conditional Statement Script Example

#if the following statement is true, the script executes
if(Test-Path -Path $pathFile) {
    #output the string
    Write-Output "The File Exist Here"

    #output the contents of file
    Get-Content -Path $pathFile
}
else {
    #For referencing variable paths, use double quotes on strings
    Write-Output "File '$pathFile' does not exist!"
}

### Nested If-Else Statements
$pathFile1 = "/home/bred/Desktop/PowerShell101/Powershell101/Basics/Data Reading/test1.txt"

if(Test-Path -Path $pathFile1) {
    $Data = Get-Content -Path $pathFile1
    if($Data.count -lt 5) {
        Write-Output "This file has less than five lines"
    }
    elseif ($Data.Count -lt 2) {
        Write-Output "This file has less two lines"
    }
    else {
        Write-Output "There's a lot of lines here lol"
    }
    Write-Output "Statement completed!"
}
else {
    Write-Output = "File '$pathFile1' does not exist!"
}