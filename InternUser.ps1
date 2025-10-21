$LocalUserList = Get-LocalUser
$user = "intern_test"

if($LocalUserList.Name -contains $user){
	Write-Host "$user exists :)"
	}
else{
	New-LocalUser -Name $user -Description "Intern" -Password (Read-Host -AsSecureString "Password: ") -FullName "Mike Wazowski"
  Add-LocalGroupMember -Group "Administrators" -Member $user
} 
