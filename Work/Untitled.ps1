Set-StrictMode -Version Latest

$input = Read-Host "1 2 or 3"

if ($input -eq "1") {
    Write-Host "Stopping. Double check first."
    break
}
if ($input -eq "3") {
    Write-Host "dude"
}

Write-Host "Hello World"