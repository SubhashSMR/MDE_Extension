# Install Azure Powershell module.
Install-Module -Name Az -Repository PSGallery -Force

# To start managing your Azure resources with the Az PowerShell module, launch a PowerShell session and run Connect-AzAccount to sign in to Azure.
Connect-AzAccount

# Run the powershell script to export the Azure Connected Machines to C:\Temp folder and import the csv file and remove the MDE.Windows extension.