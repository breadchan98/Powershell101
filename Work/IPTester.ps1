Set-StrictMode -Version Latest

<#

Multiple IP testing or something idk
- Print out statement if pingable
- Multiple IP read from file

#>

#Exception error if file not found
try {
    $pduip = Get-Content "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\pdu-ip.txt" -ErrorAction Stop
    $kvmip = Get-Content "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\kvm-ip.txt" -ErrorAction Stop
}
catch {
    throw "One of the files could not be found"
}
if (-not $pduip) {
    throw "Empty file, no IPs"
}
if (-not $kvmip) {
    throw "Empty file, no IPs"
}

$pduResults = $pduip | ForEach-Object -Parallel {
    if(Test-Connection $_ -Count 2 -Quiet) {
        Write-Output "$_ is pingable."
    }
    else {
        Write-Output "$_ is not pingable"
    }
}

$kvmResults = $kvmip | ForEach-Object -Parallel {
    if(Test-Connection $_ -Count 2 -Quiet) {
        Write-Output "$_ is pingable."
    }
    else {
        Write-Output "$_ is not pingable"
    }
}

Write-Output "Results for PDU IPs: `n"
$pduResults

Write-Output "Results for KVM IPs: `n"
$kvmResults