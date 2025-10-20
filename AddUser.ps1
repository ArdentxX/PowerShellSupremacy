param(
[string]$Imie,
[string]$Nazwisko,
[string]$Dzial
)
$tab = Import-Csv nowi_pracownicy.csv
$ManagerLoginList = $tab.ManagerLogin
$Firstlog = $Imie.Substring(0,1).ToLower() + $Nazwisko.ToLower()
$ManagerLogin = $Firstlog
$i = 0
while($ManagerLoginList -contains $ManagerLogin){
		$i++
		$ManagerLogin = $Firstlog  + [string]$i}
$Password = -join(1..10 | ForEach-Object { Get-Random -Minimum 0 -Maximum 10})

$tab += [PSCustomObject]@{
	Imie = $Imie 
	Nazwisko =$Nazwisko
	Dzial = $Dzial
	ManagerLogin = $ManagerLogin
	Password = $Password
}

$tab |Select-Object Imie, Nazwisko, Dzial, ManagerLogin, Password | Export-Csv nowi_pracownicy.csv -NoTypeInformation
return $tab
