#Used for error checking
Set-StrictMode -Version Latest

$x = Read-Host "Number of files"

for($i = 1; $i -le $x; $i++) {
    New-Item -Path "C:\Users\bred-pc\Desktop\Work\Data" -Name "DUT-DSP110$i.txt" -ItemType File -Force
}