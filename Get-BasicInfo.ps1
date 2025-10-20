$tab =@()
$tab += Get-ComputerInfo |Select-Object @{Name = "Name"; Expression = {"CsName"}}, @{Name = "Info"; Expression = {$_.CsName}}

$tab += Get-ComputerInfo |Select-Object @{Name = "Name"; Expression = {"Version"}}, @{Name = "Info"; Expression = {$_.OsVersion}}

$tab += Get-ComputerInfo |Select-Object @{Name = "Name"; Expression = {"RAM(GB)"}}, @{Name = "Info"; Expression = {[math]::Round($_.CsTotalPhysicalMemory/1GB,2)}}

$tab +=[PSCustomObject]@{Name = "Active User" 
  Info = $env:USERNAME}
$tab += Get-NetIPConfiguration |Select-Object @{Name = "Name"; Expression = {"IPv4Address"}}, @{Name = "Info"; Expression = {$_.IPv4Address}}

$tab | Set-Content -Path info11.txt  
$tab | Export-Csv -Path info11.csv
return $tab
