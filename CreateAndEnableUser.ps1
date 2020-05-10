param([switch]$help)
function funHelp()
{
$helpText=@"
DESCRIPTION:
NAME: CreateAndEnableUser.Ps1
Creates an enabled user account by reading csv file
 
PARAMETERS: 
 
-help        prints help file
 
SYNTAX:
CreateAndEnableUser.Ps1 
 
Creates an enabled user by reading a csv file
 
CreateAndEnableUser.Ps1 -help
 
Displays the help topic for the script
 
"@
$helpText
exit
}
 
if($help){ "Obtaining help ..." ; funhelp }
 
$aryUser= import-csv -Path c:\psbook\enabledusers.csv
$Class = "User"
$dc = "dc=nwtraders,dc=com"
 
foreach($strUser in $aryUser)
{
 $ou = "ou="+$strUser.OU
 $ADSI = [ADSI]"LDAP://$ou,$dc"
 $cnuser="cn="+$($strUser.userName)
 $User = $ADSI.create($CLass,$cnuser)
 $User.put("SamaccountName", $($strUser.username))
 $User.setInfo()
 $User.put("userPassword", $($strUser.Password))
 $user.psbase.invokeset("AccountDisabled", "False")
 $User.setInfo()
}
