function Get-FREDSeriesSearchRelatedTag {
    <#
    .SYNOPSIS
        Gets the related tags for a series search.
    .DESCRIPTION
        Gets the related tags for a series search.
    .PARAMETER SearchText
        The words to match against economic data series.
    .PARAMETER TagNames
        The names of tags to match against series.
    .PARAMETER TagGroupId
        The ID for a tag group.
    .PARAMETER SearchType
        Indicates the type of text match for the series search.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset of the first result.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by orderby.
    .EXAMPLE
        Get-FREDSeriesSearchRelatedTag -SearchText "monetary service index"
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
        $uri = "https://api.stlouisfed.org/fred/related_tags?search_text=$SearchText&api_key=$($global:apiKey)&file_type=json"
        if ($TagNames) {
            $uri += "&tag_names=$($TagNames -join ',')"
        }
        if ($TagGroupId) {
            $uri += "&tag_group_id=$TagGroupId"
        }
        if ($SearchType) {
            $uri += "&search_type=$SearchType"
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
