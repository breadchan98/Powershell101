Set-StrictMode -Version Latest

$fileCount = Get-ChildItem -Path "C:\Users\bred-pc\Desktop\Work\Data"
$x = $fileCount.Length

for($i = 1; $i -le $x; $i++) {
    $uuidmac = & "$PSScriptRoot\UUID-MAC-Fake.ps1"
    Add-Content -Path "C:\Users\bred-pc\Desktop\Work\Data\DUT-DSP110$i.txt" -Value $uuidmac
}