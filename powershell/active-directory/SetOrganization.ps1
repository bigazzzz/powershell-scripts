$strDomain = "dc=nwtraders,dc=msft"
$strOU = "ou=myTestOU"
$strUser = "cn=MyNewUser"
$strManager = "cn=myBoss"
 
$objUser = [ADSI]"LDAP://$strUser,$strOU,$strDomain"
$objUser.put("title", "Mid-Level Manager")
$objUser.put("department", "sales")
$objUser.put("company", "North Wind Traders")
$objUser.put("manager", "$strManager,$strou,$strDomain")
 
$objUser.setInfo()
