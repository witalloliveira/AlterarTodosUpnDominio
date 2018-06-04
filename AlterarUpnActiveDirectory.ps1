Import-Module ActiveDirectory

$oldSuffix = "diegomatos.local"
$newSuffix = "labcloud2go.com.br"

$OU = "OU=Temp,DC=diegomatos,DC=local"
$server = "DCM1"

Get-ADUser -SearchBase $OU -filter * | ForEach-Object {
$newUPN = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix)
$_ | Set-ADUser -server $server -UserPrincipalName $newUPN
}