set-AzContext -Subscription '' #(Where ever the Storage account is)
Set-AzCurrentStorageAccount -ResourceGroupName "" -Name "" #(Stroage Account)
$containerName = #"Container in Storage Account"
$blobVersion = Get-AzStorageBlob -Container $containerName #(Set Container Name)
$blobVersion = $blobVersion | Remove-AzStorageBlobImmutabilityPolicy
$ContainerName = "" #(The Container you want)
Get-AzStorageBlob -Container $ContainerName -Context $ctx 
Get-AzStorageBlob -Container $ContainerName -Context $ctx | ForEach-Object {Remove-AzStorageBlob -ICloudBlob $_.ICloudBlob -Context $ctx}
