function Get-FREDSeriesVintagedates {
    <#
    .SYNOPSIS
        Gets the dates in history when a series' data values were revised or new data values were released.
    .DESCRIPTION
        Gets the dates in history when a series' data values were revised or new data values were released.
    .PARAMETER SeriesID
        The ID for a series.
    .EXAMPLE
        Get-FREDSeriesVintagedates -SeriesID="GNPCA"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/series_vintagedates.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/series_vintagedates.html
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
        $uri = "https://api.stlouisfed.org/fred/series_vintagedates?series_id=$SeriesID&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
