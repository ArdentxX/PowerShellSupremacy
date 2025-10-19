function FindDisk{
  Get-CimInstance -ClassName "Win32_LogicalDisk" | Select-Object Name,@{Name ="Space(GB)";Expression = {[math]::Round($_.Size/1GB,2)}}, @{Name ="FreeSpace(GB)"; Expression = {[math]::Round($_.FreeSpace/1GB,2)}}
  }
