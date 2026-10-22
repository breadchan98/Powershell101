Set-StrictMode -Version Latest

<#

Multiple IP testing or something idk
- Print out statement if pingable
- Multiple IP read from file

#>

$pduip = Get-Content "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\pdu-ip.txt"
$kvmip = Get-Content "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\kvm-ip.txt"

#execute if file is empty
if (-not $pduip) {
    Write-Error "PDU IP file is empty"
}

$pduResults = $pduip | ForEach-Object -Parallel {
    if(Test-Connection $_ -Count 2 -Quiet) {
        Write-Output "$_ is pingable."
    }
    else {
        Write-Output "$_ is not pingable"
    }
}

if (-not $kvmip) {
    Write-Error "KVM IP file is empty"
}

$kvmResults = $kvmip | ForEach-Object -Parallel {
    if(Test-Connection $_ -Count 2 -Quiet) {
        Write-Output "$_ is pingable."
    }
    else {
        Write-Output "$_ is not pingable"
    }
}

Write-Output ""
Write-Output "Results for PDU IPs:"
$pduResults

Write-Output ""
Write-Output "Results for KVM IPs:"
$kvmResults