function Get-FREDReleases {
    <#
    .SYNOPSIS
        Gets all releases of economic data.
    .DESCRIPTION
        Gets all releases of economic data.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset number of results to return.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by the orderby parameter.
    .PARAMETER FilterVariable
        The attribute to filter results by.
    .PARAMETER FilterValue
        The value of the filter_variable attribute to filter results by.
    .EXAMPLE
        Get-FREDReleases -Limit 10
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/releases.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/releases.html
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
        [ValidateSet('release_id', 'name', 'press_release', 'realtime_start', 'realtime_end', 'link', 'notes')]
        [string]$OrderBy = 'release_id',
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder = 'asc'
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/releases?limit=$Limit&offset=$Offset&order_by=$OrderBy&sort_order=$SortOrder&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
