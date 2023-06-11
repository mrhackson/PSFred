function Get-FREDSources {
    <#
    .SYNOPSIS
        Gets all sources of economic data.
    .DESCRIPTION
        Gets all sources of economic data.
    .EXAMPLE
        Get-FREDSources
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/sources.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/sources.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param ()
    process {
        $uri = "https://api.stlouisfed.org/fred/sources?api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
