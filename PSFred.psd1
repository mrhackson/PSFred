@{
    # If authoring a script module, the RootModule is the name of your .psm1 file
    RootModule = 'PSFred.psm1'

    Author = 'MrHackson'

    CompanyName = 'Hackson Enterprises'

    ModuleVersion = '0.1'

    # Use the New-Guid command to generate a GUID, and copy/paste into the next line
    GUID = 'e0da4aed-de01-4a68-8377-3642ae77b730'

    Copyright = '2023 Hackson Enterprises'

    Description = 'Get economic data from Fred API'

    # Minimum PowerShell version supported by this module (optional, recommended)
    # PowerShellVersion = ''

    # Which PowerShell Editions does this module work with? (Core, Desktop)
    CompatiblePSEditions = @('Desktop', 'Core')

    # Which PowerShell functions are exported from your module? (eg. Get-CoolObject)
    ###Get-ChildItem functions | select -ExpandProperty BaseName | clip
    FunctionsToExport = @('Get-FREDCategory', 'Set-MyFREDAPIKey')

    # Which PowerShell aliases are exported from your module? (eg. gco)
    AliasesToExport = @('')

    # Which PowerShell variables are exported from your module? (eg. Fruits, Vegetables)
    VariablesToExport = @('')

    # PowerShell Gallery: Define your module's metadata
    PrivateData = @{
        PSData = @{
            # What keywords represent your PowerShell module? (eg. cloud, tools, framework, vendor)
            Tags = @('cooltag1', 'cooltag2')

            # What software license is your code being released under? (see https://opensource.org/licenses)
            LicenseUri = ''

            # What is the URL to your project's website?
            ProjectUri = ''

            # What is the URI to a custom icon file for your project? (optional)
            IconUri = ''

            # What new features, bug fixes, or deprecated features, are part of this release?
            ReleaseNotes = @'
'@
        }
    }

    # If your module supports updatable help, what is the URI to the help archive? (optional)
    # HelpInfoURI = ''
}