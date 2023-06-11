function Get-FredCategorySeries{
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$categoryid
    )

    # Create the URI for the request
    $uri = $fredapiuri + "/category/series?category_id=" + $categoryid + "&api_key=" + $fredapikey + "&file_type=json"

    try{
        # Invoke the API and get the response
        $response = Invoke-RestMethod -Uri $uri -Method Get

        # If the response contains data, return the series
        if($response.count -gt 0){
            $response.series
        }
        else{
            Write-Error "No series found for category ID $categoryid"
        }
    }
    catch{
        Write-Error $_
    }
}