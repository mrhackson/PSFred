function Get-FREDSeries{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
       [string]$SeriesID,
        [Parameter(Mandatory=$false, position=1)]
        [ValidateSet("xml","json")]
        [string]$filetype = "json",
        [Parameter(Mandatory=$false, position=2)]
        [datetime]$realtimestart,
        [Parameter(Mandatory=$false, position=3)]
        [datetime]$realtimeend
    )
    #Create the URI
    $uri = $fredapiuri + "/series?series_id=" + $SeriesID + "&api_key=" + $fredapikey + "&file_type=json"
    if($realtimestart -ne $null){
        $uri += "&realtime_start=" + $realtimestart.ToString("yyyy-MM-dd")
    }
    if($realtimeend -ne $null){
        $uri += "&realtime_end=" + $realtimeend.ToString("yyyy-MM-dd")
    }
    try{
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the series
        $response.seriess
    }
    catch{
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeries: $_"
    }
}
