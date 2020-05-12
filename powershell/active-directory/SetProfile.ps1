$objUser = [ADSI]"LDAP://cn=MyNewUser,ou=myTestOU,dc=nwtraders,dc=msft"
$objUser.put("profilePath", "\\London\profiles\myNewUser")
$objUser.put("scriptPath", "logon.vbs")
$objUser.put("homeDirectory", "\\london\users\myNewUser")
$objUser.put("homeDrive", "H:")
$objUser.setInfo()
