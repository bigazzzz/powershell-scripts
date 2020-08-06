# По логину в определенном OrganizationUnit
# $Users = Get-ADUser -Filter {SamAccountName -eq 'ashatunov'} -SearchBase "OU=SAD,OU=SBSUsers,OU=Users,OU=MyBusiness,DC=ad,DC=local"
# Все пользователи
# $Users = Get-ADUser -Filter * 
# Все пользователи в определенном OrganizationUnit
$Users = Get-ADUser -Filter * -SearchBase "OU=SAD,OU=SBSUsers,OU=Users,OU=MyBusiness,DC=ad,DC=local"
foreach ($User in $Users)
{
	# Для пользователей удалить галку "Пользователь не может менять пароли" и "Пароль никогда не устаревает"
	Set-ADUser -Identity $User -CannotChangePassword $False -PasswordNeverExpires $False
}