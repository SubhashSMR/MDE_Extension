This script developed to remove **Microsoft Defender Extension** from Azure Arc machines.

# Pre-requisites
1) Install Azure Powershell module.
   
**Install-Module -Name Az -Repository PSGallery -Force**

# Sign In
2) To start managing your Azure resources with the Az PowerShell module, launch a PowerShell session and run Connect-AzAccount to sign in to Azure.
**Connect-AzAccount**

# Execute the script
3) Run the powershell script to export the Azure Connected Machines to C:\Temp folder and import the csv file and remove the MDE.Windows extension.
