# Define log file location in the user's Documents folder
$LogFile = "$env:USERPROFILE\Documents\PhoneRemoval.log"

# Define the app package name
$AppName = "Microsoft.YourPhone"

# Function to log messages
function Write-Log {
    param ([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $LogFile -Value "$Timestamp - $Message"
}

# Check if the Your Phone app is installed for all users
$AppPackage = Get-AppxPackage -AllUsers | Where-Object { $_.Name -eq $AppName }

if ($AppPackage) {
    # Attempt to remove the app
    try {
        Remove-AppxPackage -Package $AppPackage.PackageFullName -AllUsers -ErrorAction Stop
        Write-Log "Successfully removed Phone Link, ($AppName) for all users."
    } catch {
        Write-Log "Failed to remove '$AppName'. Error: $_"
    }
} else {
    Write-Log "'$AppName' is not installed. No action taken."
}
