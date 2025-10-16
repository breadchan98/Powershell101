#Used for error checking
Set-StrictMode -Version Latest

$sourceDir = ""
$destinationFile = ""

while ($true) {
    # Get all .txt files except the destination file
    $files = Get-ChildItem -Path $sourceDir -Filter "*.txt" | Where-Object { $_.FullName -ne $destinationFile }

    if ($files.Count -eq 0) {
        break
    }

    foreach ($file in $files) {
        try {
            $content = Get-Content -Path $file.FullName
            Add-Content -Path $destinationFile -Value $content
        }
        catch {
            Write-Host "Error reading $($file.Name): $($_.Exception.Message)"
        }
    }

    Write-Host "All files processed."
    break
}
