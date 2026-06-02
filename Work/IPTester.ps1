Set-StrictMode -Version Latest

<#

Multiple IP testing or something idk
- Print out statement if pingable
- Multiple IP read from file

#>

$ip = Get-Content "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\pdu-ip.txt"

$results = $ip | ForEach-Object -Parallel {
    if(Test-Connection $_ -Count 2 -Quiet) {
        Write-Output "$_ is pingable."
    }
    else {
        Write-Output "$_ is not pingable"
    }
}

Write-Output "The following IPs: `n"
$results