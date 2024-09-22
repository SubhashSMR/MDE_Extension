Write-Host "Script to remove Microsoft Defender for Endpoint extension from the machines listed in CSV file" -BackgroundColor Cyan -ForegroundColor Red
$OutputPath = "C:\Temp\Arc_Report"
# Create output directory if not exists
if (-not (Test-Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory
}
$FileName = $(get-date -f yyyyMMdd) + "_ArcMachines.csv"
#Get-AzConnectedMachine -ResourceGroupName NESC-Update-Management-RG | %{Get-AzConnectedMachineExtension -ResourceGroupName $_.ResourceGroupName -MachineName $_.Name} | Export-Csv -Path $OutputPath\$FileName -NoTypeInformation
Get-AzConnectedMachine -ResourceGroupName NESC-Update-Management-RG | Export-Csv -Path $OutputPath\$FileName -NoTypeInformation
Write-Host "Please wait for the Azure Arc machines report to be exported in csv and report found here '$OutputPath' " -BackgroundColor Green -ForegroundColor Blue
Start-Sleep -Seconds 10
$Import = Import-Csv -Path $OutputPath\$FileName
foreach($I in $Import) {
    $Resource = Get-AzResource -Name $I.Name
    #Get-AzResource -ResourceId $Resource.ResourceId
    Remove-AzConnectedMachineExtension -MachineName $I.Name -ResourceGroupName NESC-Update-Management-RG -Name MDE.Windows -AsJob
    Write-Progress -Activity "Processing items" -Status "Processing item $I" -PercentComplete (($Import.IndexOf($I) / $Import.Count) * 100)
}