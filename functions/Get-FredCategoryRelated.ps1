Function Get-FredCategoryRelated{
    #Returns a list of categories to which the category has been related
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
       [string]$categoryid
    )
    #Create the URI
    $uri = $fredapiuri + "/category/related?category_id=" + $categoryid + "&api_key=" + $fredapikey + "&file_type=json"
    try{
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the categories
        $response.categories
    }
    catch{
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FredCategoryRelated: $_"
    }
}