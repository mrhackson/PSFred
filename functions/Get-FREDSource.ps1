function Get-FREDSource {
    <#
    .SYNOPSIS
        Gets the sources of economic data.
    .DESCRIPTION
        Gets the sources of economic data.
    .PARAMETER SourceID
        The ID for a source.
    .EXAMPLE
        Get-FREDSource -SourceID 1
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/source.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/source.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SourceID
    )
    process {
        if ($SourceID) {
            $uri = "https://api.stlouisfed.org/fred/source?source_id=$SourceID&api_key=$($global:apiKey)&file_type=json"
        }
        else {
            $uri = "https://api.stlouisfed.org/fred/source?api_key=$($global:apiKey)&file_type=json"
        }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
