function Get-FREDRelatedTag {
    <#
    .SYNOPSIS
        Gets the related tags for a series.
    .DESCRIPTION
        Gets the related tags for a series.
    .PARAMETER SeriesID
        The ID for a series.
    .EXAMPLE
        Get-FREDRelatedTag -SeriesID="GNPCA"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/related_tags.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/related_tags.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SeriesID
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/related_tags?series_id=$SeriesID&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
