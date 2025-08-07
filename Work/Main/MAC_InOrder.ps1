$getChild = Get-ChildItem -Path .\Data
$datadircount = $getChild.Length

$output = @()
for($i = 1; $i -le $datadircount; $i++) {
    $filePath = "C:\Users\bred-pc\Desktop\Work\Data\DUT-DSP110$i.txt"
    if (Test-Path $filePath) {
        $lines = Get-Content -Path $filePath
        $mac = $lines[1]
        $output += $mac
    }
}
$output | Set-Content -Path "C:\Users\bred-pc\Desktop\Work\Main\All MAC in Order.txt"
