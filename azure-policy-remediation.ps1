//This script is to check for all of your "deployIfNotExist" policies and then run them automatically. You have to use Automation Accounts and set a schedule to run the script.

Write-Output "Connecting to azure via Connect-AzAccount -Identity"
$clientID = "" #(App Registration)
$key = "" #(Secret Key from App Reg.)
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential `
     -argumentlist $clientID, $SecurePassword
$tenantID = "" #(Root Tenant)
Connect-AzAccount -Credential $cred -TenantId $tenantID -ServicePrincipal
Write-Output "Successfully connected with Automation account's Managed Identity"

# in case you have multiple subscriptions...
# Get all Azure Subscriptions
$azSubs = Get-AzSubscription

# Loop through all Azure Subscriptions
foreach ($azSub in $azSubs) {
Set-AzContext $azSub.id | Out-Null

# get all non-compliant policies that can be remediated
$nonCompliantPolicies = Get-AzPolicyState | Where-Object { $_.ComplianceState -eq "NonCompliant" -and $_.PolicyDefinitionAction -eq "deployIfNotExists" }

# loop through ans start individual tasks per policy 
foreach ($policy in $nonCompliantPolicies) {

    $remediationName = "rem." + $policy.PolicyDefinitionName
     Start-AzPolicyRemediation -Name $remediationName -PolicyAssignmentId $policy.PolicyAssignmentId
}}
