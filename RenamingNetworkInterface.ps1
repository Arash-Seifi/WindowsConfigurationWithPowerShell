#---------------------------------------Changing Network interface Name--------------------------

# Define new names for the network interfaces
$newNames = @("LAN1", "LAN2")

# Get all network adapters
$networkAdapters = Get-NetAdapter

# Display the current names of network interfaces
Write-Output "Current network interfaces:"
$networkAdapters | Select-Object Name

# Rename network interfaces
$index = 0
foreach ($adapter in $networkAdapters) {
    # checks if the value of $index is less than the length of the $newNames array. This ensures that there are still new names available in the list to assign to the network adapters.
    if ($index -lt $newNames.Length) {
        # Set new name for the adapter
        $newName = $newNames[$index]
        Rename-NetAdapter -Name $adapter.Name -NewName $newName -Confirm:$false
        Write-Output "Renamed adapter '$($adapter.Name)' to '$newName'."
        $index++
    } else {
        Write-Output "No more names available to assign."
        break
    }
}

# Display the new names of network interfaces
Write-Output "New network interfaces:"
Get-NetAdapter | Select-Object Name