function Get-FREDSeriesCategories {
    <#
    .SYNOPSIS
        Get the categories for a series.
    .DESCRIPTION
        Get the categories for a series.
    .PARAMETER SeriesID
        The series ID
    .PARAMETER filetype
        The file type to return. Valid values are xml and json.
    .LINK
        https://fred.stlouisfed.org/docs/api/fred/series_categories.html
    .EXAMPLE
        Get-FREDSeriesCategories -SeriesID "GNPCA"
    .EXAMPLE
        Get-FREDSeriesCategories -SeriesID "GNPCA" -filetype "xml"
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
    $uri = $fredapiuri + '/series/categories?series_id=' + $SeriesID + '&api_key=' + $fredapikey + '&file_type=json'
    try {
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the categories
        $response.categories
    }
    catch {
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeriesCategories: $_"
    }
}
