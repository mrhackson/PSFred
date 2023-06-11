function Get-FREDSourceReleases {
    <#
    .SYNOPSIS
        Gets all releases of economic data sources.
    .DESCRIPTION
        Gets all releases of economic data sources.
    .PARAMETER FileType
        A file type, either xml or json.
    .PARAMETER SourceID
        The ID for a source.
    .PARAMETER RealtimeStart
        The start of the real-time period.
    .PARAMETER RealtimeEnd
        The end of the real-time period.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset number of results to skip.
    .PARAMETER SortOrder
        Sort results is ascending or descending order (default: asc).
    .EXAMPLE
        Get-FREDSourceReleases
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/source_releases.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/source_releases.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param(
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $FileType = 'json',
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $SourceID,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $RealtimeStart,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $RealtimeEnd,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Limit,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Offset,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $SortOrder,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $OrderBy
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/source_releases?api_key=$($global:apiKey)&file_type=$FileType"
        if ($SourceID) { $uri += "&source_id=$SourceID" }
        if ($RealtimeStart) { $uri += "&realtime_start=$RealtimeStart" }
        if ($RealtimeEnd) { $uri += "&realtime_end=$RealtimeEnd" }
        if ($Limit) { $uri += "&limit=$Limit" }
        if ($Offset) { $uri += "&offset=$Offset" }
        if ($SortOrder) { $uri += "&sort_order=$SortOrder" }
        if ($OrderBy) { $uri += "&order_by=$OrderBy" }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
