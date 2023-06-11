function Get-FREDTagSeries {
    <#
    .SYNOPSIS
        Gets the series matching tags.
    .DESCRIPTION
        Gets the series matching tags.
    .PARAMETER TagNames
        The names of one or more tags.
    .PARAMETER TagGroupID
        The ID for a tag group.
    .PARAMETER SearchText
        The words to match against economic data series names, descriptions, and tags.
    .PARAMETER RealTimeStart
        The start of the real-time period.
    .PARAMETER RealTimeEnd
        The end of the real-time period.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset of the first result.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by the orderby parameter.
    .EXAMPLE
        Get-FREDTagSeries -TagNames "monetary aggregates" -Limit 10
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/series_search.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/series_search.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string[]]$TagNames,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$TagGroupID,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SearchText,
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
        [string]$OrderBy,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SortOrder
    )
    process {
        $uri = 'https://api.stlouisfed.org/fred/series/search?tag_names={0}&api_key={1}&file_type=json' -f $TagNames, $env:FRED_API_KEY
        if ($TagGroupID) {
            $uri += "&tag_group_id=$TagGroupID"
        }
        if ($SearchText) {
            $uri += "&search_text=$SearchText"
        }
        if ($RealTimeStart) {
            $uri += "&realtime_start=$RealTimeStart"
        }
        if ($RealTimeEnd) {
            $uri += "&realtime_end=$RealTimeEnd"
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
        $response = Invoke-RestMethod -Uri $uri
        $response.seriess
    }
}
