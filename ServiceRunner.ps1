$StoppedServices =@()
$Result = @()
$StoppedServices += Get-Service | Where-Object {$_.Status -eq "Stopped" -and $_.StartType -eq "Automatic"}

foreach($Ser in $StoppedServices){
	$StartResult
	try{
		Start-Service -Name $Ser.Name -ErrorAction Stop
		$StartResult = "Started"
	}catch{
		Write-Host "Usługa $($Ser.Name) nie została uruchomiona"
		$StartResult = "Failed"
		}
	$Result +=[PSCustomObject]@{
		ServiceName = $Ser.Name
		StartType = $Ser.StartType
		StatusBefore = "Stopped"
		StatusAfter = (Get-Service -Name $Ser.Name).Status
		StartResult = $StartResult
		
		}	
}




$Result | Export-Csv -Path ServiceReport_data.csv -NoTypeInformation
