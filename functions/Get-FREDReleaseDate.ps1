function Get-FREDReleaseDate {
    <#
    .SYNOPSIS
        Gets release dates for all releases of economic data.
    .DESCRIPTION
        Gets release dates for all releases of economic data.
    .PARAMETER ReleaseID
        The ID for a release.
    .EXAMPLE
        Get-FREDReleaseDate -ReleaseID 51
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/release_dates.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/release_dates.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$ReleaseID
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/release_dates?release_id=$ReleaseID&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}