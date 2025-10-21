$DiskInfoTab = Get-PSDrive -PSProvider FileSystem

$Result = @()

foreach($Disk in $DiskInfoTab){
	$Proc =[math]::Round(($Disk.Used/($Disk.Free+$Disk.Used))*100,2)
	$Result += [PSCustomObject]@{
		DriveLetter = $Disk.Name
		UsedGB =[math]::Round($Disk.Used/1GB,2)
		FreeGB =[math]::Round($Disk.Free/1GB,2)
		PercentUsed = $Proc
		}
	if($Proc -ge 90){
	Write-Host "WARNING LOW AMOUNT OF SPACE"
	}
}


$Result | Export-Csv Space.csv -NoTypeInformation
