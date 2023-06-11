Function Set-MyFREFAPIKey{
    [CmdletBinding()]
    param(
        $path = "$env:userprofile\AppData\local\fred\fred.xml",
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$key
    )
    # Create the credential object
    $credential = New-Object System.Management.Automation.PSCredential -ArgumentList "fred", $(ConvertTo-SecureString $key -AsPlainText -Force)
    # Create the path if it doesn't exist
    $folder = Split-Path -Parent $path
    if(!(Test-Path $folder)){
        New-Item -ItemType Directory -Path $folder | Out-Null
    }
    # Export the credential to the XML file
    $credential | Export-Clixml -Path $path
}
