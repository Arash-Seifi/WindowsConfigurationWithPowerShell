#---------------------------------------Block USB Ports------------------------------------------

# Define the registry path for USB storage
$usbStorRegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR"

# Define the registry key and value to disable USB storage
$disableUsbValue = 4  # 4 = Disabled, 3 = Manual, 2 = Automatic

# Check if the registry path exists
if (Test-Path $usbStorRegPath) {
    Write-Output "Disabling USB storage devices..."
   
   # Set the 'Start' value to disable USB storage
   Set-ItemProperty -Path $usbStorRegPath -Name "Start" -Value $disableUsbValue
   
   Write-Output "USB storage devices have been disabled."
} else {
   Write-Output "USBSTOR service registry key not found."
}

Write-Output "Please restart the computer for the changes to take effect."


