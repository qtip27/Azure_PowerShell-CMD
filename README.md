Azure PowerShell Commands README
Overview

This repository contains a collection of PowerShell commands (cmdlets) for interacting with Microsoft Azure services. These commands leverage the Azure PowerShell module to streamline the management and automation of various Azure resources.
Prerequisites

Before using these PowerShell commands, ensure you have the following prerequisites:

    Azure PowerShell module
    Azure subscription and appropriate permissions

Installation

    Install Azure PowerShell Module:

    powershell

Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser

Import the Module:

powershell

Import-Module Az

Connect to Azure:

powershell

    Connect-AzAccount

Usage

    Command 1:

    powershell

Get-AzResourceGroup

Description: Retrieve information about Azure resource groups.

Parameters:

    -ResourceGroupName: Name of the resource group.

Example:

powershell

Get-AzResourceGroup -ResourceGroupName "MyResourceGroup"

Command 2:

powershell

New-AzStorageAccount -ResourceGroupName <ResourceGroupName> -AccountName <StorageAccountName> -SkuName Standard_LRS -Location <Location>

Description: Create a new Azure Storage Account.

Parameters:

    -ResourceGroupName: Name of the resource group.
    -AccountName: Name of the storage account.
    -Location: Azure region for the storage account.

Example:

powershell

    New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -SkuName Standard_LRS -Location "East US"

Contributing

Contributions are welcome! If you have additional commands or improvements, please open an issue or submit a pull request.
License

This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

    Special thanks to the Azure PowerShell Team for providing the core modules.

Resources

    Azure PowerShell Documentation
    Azure PowerShell GitHub Repository

Contact

For any questions or support, please contact donaldhunter5@gmail.com.
