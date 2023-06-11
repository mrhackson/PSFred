function Get-FREDReleasesDates {
    <#
    .SYNOPSIS
        Gets release dates for all releases of economic data.
    .DESCRIPTION
        Gets release dates for all releases of economic data.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset number of results to return.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by the orderby parameter.
    .PARAMETER IncludeReleaseDatesWithNoData
        Determines whether release dates with no data available are returned. The default value is false, which means that release dates with no data are not returned.
    .PARAMETER ReleaseID
        The ID for a release.
    .EXAMPLE
        Get-FREDReleasesDates -Limit 10 -Offset 0 -OrderBy release_id -SortOrder asc -IncludeReleaseDatesWithNoData $false -ReleaseID 51
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/releases_dates.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/releases_dates.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, 10000)]
        [int]$Limit = 1000,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(0, 10000)]
        [int]$Offset = 0,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('release_id', 'release_name', 'release_date', 'release_press_release', 'release_link', 'notes', 'created', 'popularity', 'realtime_start', 'realtime_end')]
        [string]$OrderBy = 'release_id',
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder = 'asc'
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/releases/dates?limit=$Limit&offset=$Offset&order_by=$OrderBy&sort_order=$SortOrder&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
