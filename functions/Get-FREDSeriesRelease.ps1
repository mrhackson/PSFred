function Get-FREDSeriesRelease {
    <#
    .SYNOPSIS
        Get the release for a series.
    .DESCRIPTION
        Get the release for a series.
    .PARAMETER SeriesID
        The series ID
    .PARAMETER filetype
        The file type to return. Valid values are xml and json.
    .LINK
        https://fred.stlouisfed.org/docs/api/fred/series_release.html
    .EXAMPLE
        Get-FREDSeriesRelease -SeriesID "GNPCA"
    .EXAMPLE
        Get-FREDSeriesRelease -SeriesID "GNPCA" -filetype "xml"
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$SeriesID,
        [Parameter(Mandatory = $false, position = 1)]
        [ValidateSet('xml', 'json')]
        [string]$filetype = 'json'
    )
    #Create the URI
    $uri = $fredapiuri + '/series/release?series_id=' + $SeriesID + '&api_key=' + $fredapikey + '&file_type=json'
    try {
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the release
        $response.releases
    }
    catch {
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeriesRelease: $_"
    }
}
