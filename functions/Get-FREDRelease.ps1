function Get-FREDRelease {
    <#
    .SYNOPSIS
        Gets a release of economic data.
    .DESCRIPTION
        Gets a release of economic data.
    .PARAMETER ReleaseID
        The ID for a release.
    .EXAMPLE
        Get-FREDRelease -ReleaseID 51
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/release.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/release.html
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
        $uri = "https://api.stlouisfed.org/fred/release?release_id=$ReleaseID&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}