Write-Output "Connecting to azure via Connect-AzAccount -Identity"
$clientID = "" #(App Registration)
$key = "" #(Secret Key from App Reg.)
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential `
     -argumentlist $clientID, $SecurePassword
$tenantID = "" #(Root Tenant)
Connect-AzAccount -Credential $cred -TenantId $tenantID -ServicePrincipal
Write-Output "Successfully connected with Automation account's Managed Identity"

select-azsubscription -SubscriptionName "production-secops-transit"

# Define variables
$ResourceGroupName = "<resource group>"
$VpnGatewayName = "<vpn gateway>"
$StorageSasUrl = "<link to storage account container"  # SAS URL of the storage account to save the capture

# Login to Azure (if not already logged in)
#Write-Host "Logging into Azure..."
#Connect-AzAccount

# Start packet capture
Write-Host "Starting packet capture on Azure VPN Gateway..."
Start-AzVirtualnetworkGatewayPacketCapture -ResourceGroupName $ResourceGroupName -Name $VpnGatewayName  

Write-Host "Packet capture started."

# Wait for 2 hours
Write-Host "Pausing for 2 hours..."
Start-Sleep -Seconds 7200  # 7200 seconds = 2 hours

# Stop packet capture
Write-Host "Stopping packet capture on Azure VPN Gateway..."
Stop-AzVirtualNetworkGatewayPacketCapture -ResourceGroupName $ResourceGroupName -Name $VpnGatewayName -SasUrl $StorageSasUrl

Write-Host "Packet capture stopped and saved to the storage account."
