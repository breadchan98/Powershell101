Import-Module -Name Posh-SSH

#credentials
$username = Read-Host "Enter SSH username"
$password = Read-Host "Enter SSH password" -AsSecureString
$credentials = New-Object System.Management.Automation.PSCredential ($username, $password)

$ips = Get-Content -Path "C:\Users\v-bbuenarte\OneDrive - Microsoft\Desktop\Work\Powershell101\Work\pdu-ip.txt"

foreach ($ip in $ips) 
{
    try
    {
        Write-Host "Connecting to $ip"
        $session = New-SSHSession -ComputerName $ip -Credential $credentials -AcceptKey:$true -ConnectionTimeout 60 -KeepAliveInterval 60 -Verbose

        if($session)
        {
            Write-Host "Connected to $ip"

            Write-Host "Creating shell connection."
            $stream = $session.Session.CreateShellStream("PS-SSH", 0, 0, 0, 0, 1000)
            Start-Sleep -Seconds 3 #timer

            Write-Host "Changing SNMPv2 RW"
            $stream.WriteLine("set snmp v2 setcomm private")
            Start-Sleep -Seconds 3
            $snmpOutput = $stream.Read()
            Write-Host $snmpOutput

            $stream.WriteLine("restart")
            Start-Sleep -Seconds 1
            $stream.WriteLine("y")

            #closing SSH
            Write-Host "Closing session for $ip"
            $stream.Close()
            Remove-SSHSession -SSHSession $session | Out-Null
        }
        else
        {
            Write-Host "Cannot connect to $ip"
        }
    }
    catch {
        Write-Host "Error connecting to $ip : $_"
        if ($stream) 
        { 
            $stream.Close() 
        }
        if ($session) 
        {
             Remove-SSHSession -SSHSession $session | Out-Null 
        }
    }
}