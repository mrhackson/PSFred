Function Get-FREDCategoryTag{
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$categoryid
    )
    # Build the URL
    $uri = $fredapiuri + "/category/tags?category_id=" + $categoryid + "&api_key=" + $fredapikey + "&file_type=json"
    # Invoke the API
    $response = Invoke-RestMethod -Uri $uri -Method Get
    if ($response.tags) {
        $response.tags
    } else {
        Write-Error "No tags found for category $categoryid"
    }
}