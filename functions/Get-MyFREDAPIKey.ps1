Function Get-MyFREDAPIKey{
    [CmdletBinding()]
    param(
        $path = "$env:userprofile\AppData\local\fred\fred.xml"
    )
    # Import the credential from the XML file
    $credential = Import-Clixml -Path $path
    # Return the unencrypted password
    $credential.GetNetworkCredential().Password
}
