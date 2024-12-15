# Remove-PhoneLink

A PowerShell script to automate the removal of the **Phone Link** (Microsoft.YourPhone) bloatware from Windows systems. Thing keeps getting on my system somehow, and seeing people talk about it taking up their CPU online worries me.

The script is made for Task Scheduler and does the following:

1. Checks if the **Phone Link** app is installed for all users.
2. Removes the app if it is found.
3. Logs the results in the user's **Documents** folder.

## Highlights
- Checks for a valid installation of the **Phone Link** app.
- Uninstalls the app from all user accounts on the system.
- Logs the outcome of the script.
- Requires Administrative privileges to run the script.

---

## How to Use

### Step 1: Download the Script
Save the script `Remove-PhoneLink.ps1` to a known directory on your system (e.g., `C:\Scripts`).

### Step 2: Create a Scheduled Task
1. **Open Task Scheduler**:
   - Press the Windows key and type `Task Scheduler`.
   OR
   - Press `Win + S` and search for **Task Scheduler**, then open it.

2. **Create a New Task**:
   - Click **Create Task** on the right-hand panel.

3. **General Settings**:
   - Name the task (e.g., `Uninstall Phone Link`).
   - Check **Run with highest privileges**.

4. **Set the Trigger**:
   - Go to the **Triggers** tab.
   - Click **New** and set the trigger to **At startup**.

5. **Set the Action**:
   - Go to the **Actions** tab.
   - Click **New** and select **Start a Program**.
   - In the **Program/script** field, enter:
     ```plaintext
     powershell.exe
     ```
   - In the **Add arguments (optional)** field, enter:
     ```plaintext
     -ep bypass -WindowStyle Hidden -File "C:\Path\To\Remove-PhoneLink.ps1"
     ```
     Replace `C:\Path\To\Remove-PhoneLink.ps1` with the actual path to the script.
   - You may wish to set the **Start in** field to your scripts directory for a shorter Argument field.

6. **Save the Task**:
   - Click **OK** and provide administrative credentials if prompted.

---

## Log File
The script generates a log file in the user's **Documents** folder, named `PhoneRemoval.log`. This file contains detailed information about the script's execution, including:

- Whether the app was found.
- Whether the removal was successful.
- Any errors encountered during the process.

### Sample Log Output
```plaintext
2024-12-13 08:00:00 - Successfully removed 'Microsoft.YourPhone' for all users.
2024-12-13 08:00:10 - 'Microsoft.YourPhone' is not installed. No action taken.
2024-12-13 08:00:20 - Failed to remove 'Microsoft.YourPhone'. Error: [Error Details]
```

---

## Troubleshooting
1. **Ensure Administrative Privileges**:
   - The script must be run with administrative rights to modify system apps.

2. **Check PowerShell Execution Policy**:
   - If the script fails to run, ensure the execution policy is set to allow scripts:
     ```powershell
     -ep bypass -WindowStyle Hidden -File "Remove-PhoneLink.ps1"
     ```

3. **Review Log File**:
   - Check the log file for details if the script does not behave as expected.
