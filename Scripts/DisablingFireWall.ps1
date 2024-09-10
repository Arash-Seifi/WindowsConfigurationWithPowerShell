#---------------------------------------Disabling Firewall------------------------------------

# Disable the firewall for the public and private network profile
Set-NetFirewallProfile -Profile Public -Enabled False
Set-NetFirewallProfile -Profile Private -Enabled False

# Output for firewall
Write-Output "Firewall has been disabled for both private and public profiles."


