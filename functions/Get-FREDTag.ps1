function Get-FREDTag {
    <#
    .SYNOPSIS
        Gets all tags, search words, and tag groups.
    .DESCRIPTION
        Gets all tags, search words, and tag groups.
    .PARAMETER TagNames
        A comma separated list of tag names.
    .PARAMETER TagGroupID
        A tag group ID.
    .PARAMETER SearchText
        The words to match against economic data tags, series title words, and search indexes.
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
        Get-FREDTag -TagNames "monetary aggregates, weekly, us, aggregates, weekly, fred"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/tags.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/tags.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$TagNames,
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
        [ValidateSet('series_count', 'popularity', 'created', 'name')]
        [string]$OrderBy,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder
    )
    process {
        $uri = 'https://api.stlouisfed.org/fred/tags'
        $params = @{
            api_key         = $env:FRED_API_KEY
            tag_names       = $TagNames
            tag_group_id    = $TagGroupID
            tag_search_text = $SearchText
            real_time_start = $RealTimeStart
            real_time_end   = $RealTimeEnd
            limit           = $Limit
            offset          = $Offset
            order_by        = $OrderBy
            sort_order      = $SortOrder
        }
        $response = Invoke-RestMethod -Uri $uri -Method Get -Query $params
        return $response
    }
}
