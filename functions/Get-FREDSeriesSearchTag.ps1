function Get-FREDSeriesSearchTag {
    <#
    .SYNOPSIS
        Gets the tags for a series search.
    .DESCRIPTION
        Gets the tags for a series search.
    .PARAMETER SearchText
        The words to match against economic data series.
    .PARAMETER TagNames
        The names of the tags to match against economic data series.
    .PARAMETER TagGroupId
        The ID for a tag group.
    .PARAMETER SearchType
        Indicates the type of search to perform.
    .PARAMETER RealTimeStart
        The start of the real-time period.
    .PARAMETER RealTimeEnd
        The end of the real-time period.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset number of results to skip.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by the orderby parameter.
    .EXAMPLE
        Get-FREDSeriesSearchTag -SearchText "monetary service index"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/series_search_tags.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/series_search_tags.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SearchText,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string[]]$TagNames,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$TagGroupId,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('full_text', 'series_id_only')]
        [string]$SearchType,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [datetime]$RealTimeStart,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [datetime]$RealTimeEnd,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [int]$Limit,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [int]$Offset,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('series_count', 'popularity', 'created', 'name', 'group_id')]
        [string]$OrderBy,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/series/search/tags?search_text=$SearchText&api_key=$($global:apiKey)&file_type=json"
        if ($TagNames) {
            $uri += '&tag_names=' + $TagNames -join ','
        }
        if ($TagGroupId) {
            $uri += "&tag_group_id=$TagGroupId"
        }
        if ($SearchType) {
            $uri += "&search_type=$SearchType"
        }
        if ($RealTimeStart) {
            $uri += "&realtime_start=$($RealTimeStart.ToString('yyyy-MM-dd'))"
        }
        if ($RealTimeEnd) {
            $uri += "&realtime_end=$($RealTimeEnd.ToString('yyyy-MM-dd'))"
        }
        if ($Limit) {
            $uri += "&limit=$Limit"
        }
        if ($Offset) {
            $uri += "&offset=$Offset"
        }
        if ($OrderBy) {
            $uri += "&order_by=$OrderBy"
        }
        if ($SortOrder) {
            $uri += "&sort_order=$SortOrder"
        }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
