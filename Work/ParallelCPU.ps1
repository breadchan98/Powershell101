Set-StrictMode -Version Latest

<#
Practice Parallel CPU usages
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
    New-Item -Path .\Work -Name $folderNames -ItemType File
    sleep 1;
} -ThrottleLimit 3