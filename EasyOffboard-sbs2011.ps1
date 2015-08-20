# EasyOffboard-sbs2011
# by David Hernandez

# WARNING: This script is only meant for use on sbs2011 servers
# WARNING: This script was not tested for use on any other server platform

# The following is a script that walks users through converting a user
# mailbox to a shared mailbox, allowing the mail data to be preserved in
# Exchange, and disabling the AD Account. While this can be done quickly
# through the Convert-Mailbox cmdlet, this script is intended to be used by 
# folks who have limited or no experience using the command line.

Add-PSSnapin Microsoft.Exchange.Management.Powershell.E2010

$trgt = Read-Host "Enter the primary email address of the user to convert"

Get-Mailbox -Identity $trgt | ft Name,PrimarySMTPAddress,RecipientTypeDetails

Read-Host "This will convert this user's mailbox to Shared. To continue, press 'Enter'"

Set-Mailbox -Identity $trgt -Type Shared
Get-Mailbox -Identity $trgt | ft Name,PrimarySMTPAddress,RecipientTypeDetails

Read-Host "Complete!"