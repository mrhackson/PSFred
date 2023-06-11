function Get-FREDSeriesUpdates {
    <#
    .SYNOPSIS
        Gets the 100 most recent series revisions for a given date.
    .DESCRIPTION
        Gets the 100 most recent series revisions for a given date.
    .PARAMETER Date
        The date for the series.
    .EXAMPLE
        Get-FREDSeriesUpdates -Date "2019-01-01"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/series_updates.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/series_updates.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [datetime]$Date
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/series/updates?date=$($Date.ToString('yyyy-MM-dd'))&api_key=$($global:apiKey)&file_type=json"
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}
