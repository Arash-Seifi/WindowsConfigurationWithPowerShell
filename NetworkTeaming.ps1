#---------------------------------------Bonding the Networks-------------------------------------

# Creating new network interface with bonding 2 interfaces together
New-NetSwitchTeam -Name "Team1" -TeamMembers "LAN1","LAN2"

