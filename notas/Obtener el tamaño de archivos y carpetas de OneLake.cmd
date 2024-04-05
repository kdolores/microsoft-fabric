az login --allow-no-subscriptions

Login-AzAccount -TenantId <tu-tenant-id> 

$token = Get-AzAccessToken -ResourceTypeName Storage

$token.Token | Set-Clipboard


$ctx = New-AzStorageContext -StorageAccountName 'onelake' -UseConnectedAccount -endpoint 'fabric.microsoft.com'


$workspaceName = '<nombre-o-GUID-de-tu-Workspace>'
$itemPath = '<nombre-de-tu-lakehouse>.lakehouse'


$colitems = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $workspaceName -Path $itemPath  -Recurse -FetchProperty | Measure-Object -property Length -sum


"Total file size: " + ($colitems.sum / 1GB) + " GB"


=============================================

$itemPath = '<nombre-de-tu-lakehouse>.lakehouse/Files/<nombre-de-tu-carpeta-o-archivo'

$colitems = Get-AzDataLakeGen2ChildItem -Context $ctx -FileSystem $workspaceName -Path $itemPath -Recurse -FetchProperty | Measure-Object -property Length -sum

"Total file size: " + ($colitems.sum / 1GB) + " GB"


