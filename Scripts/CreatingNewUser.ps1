#---------------------------------------Creating new user----------------------------------------

$username = "RWS1"
$password = "1234"

# Create a secure password object
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create the new user account
New-LocalUser -Name $username -Description "This is a Local User" -Password $securePassword -AccountNeverExpires 
# Set the password to never expire
Set-LocalUser -Name $username -PasswordNeverExpires $true
# Confirm the user was created
Get-LocalUser -Name $username

# Add User as a standard user belonging to a User group
Add-localGroupMember -Group "Users" -Member $username


# Check the response for autoLogin
if ($responseAutoLogin -eq "yes") {
	# Set registry keys for auto-login
	$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

	# Set the AutoAdminLogon to 1 (enable auto-login)
	Set-ItemProperty -Path $regPath -Name "AutoAdminLogon" -Value "1"

	# Set the DefaultUserName to the user name
	Set-ItemProperty -Path $regPath -Name "DefaultUserName" -Value $username

	# Set the DefaultPassword to the user's password
	Set-ItemProperty -Path $regPath -Name "DefaultPassword" -Value $password

    Write-Output "AutoLogin was enabled!!!"
} else {
    Write-Output "AutoLogin was not enabled!!!"
}

