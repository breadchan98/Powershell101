Set-StrictMode -Version Latest

# Generate Fake UUID Address
    $uuid = "$(
        $uuid1 = (((48..57) + (65..90) | Get-Random -Count 8) | ForEach-Object {[char]$_}) -join ''
        $uuid2 = (((48..57) + (65..90) | Get-Random -Count 4) | ForEach-Object {[char]$_}) -join ''
        $uuid3 = (((48..57) + (65..90) | Get-Random -Count 4) | ForEach-Object {[char]$_}) -join ''
        $uuid4 = (((48..57) + (65..90) | Get-Random -Count 4) | ForEach-Object {[char]$_}) -join ''
        $uuid5 = (((48..57) + (65..90) | Get-Random -Count 12) | ForEach-Object {[char]$_}) -join ''
        "$uuid1-$uuid2-$uuid3-$uuid4-$uuid5"
    )"

# Generate Fake MAC Address
$mac = -join (1..6 | ForEach-Object { '{0:X2}' -f (Get-Random -Minimum 0 -Maximum 256) } | ForEach-Object { "$_" + "-" })
$macAddr = $mac.TrimEnd('-')

# Output UUID and MAC
$uuid_mac = @(
    Write-Output $uuid
    Write-Output $macAddr
)

# Pulls Out
Write-Output $uuid_mac

