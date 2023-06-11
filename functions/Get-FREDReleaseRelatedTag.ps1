function Get-FREDReleaseRelatedTag {
    <#
    .SYNOPSIS
        Gets the related tags for a release.
    .DESCRIPTION
        Gets the related tags for a release.
    .PARAMETER ReleaseID
        The ID for a release.
    .EXAMPLE
        Get-FREDReleaseRelatedTag -ReleaseID 51
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/release_related_tags.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/release_related_tags.html
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
        $uri = "https://api.stlouisfed.org/fred/release_related_tags?release_id=$ReleaseID&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}