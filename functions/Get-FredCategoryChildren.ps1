Function Get-FredCategoryChildren{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$categoryid
    )
    $uri = $fredapiuri + "/category/children?category_id=" + $categoryid + "&api_key=" + $fredapikey + "&file_type=json"
    $response = Invoke-RestMethod -Uri $uri -Method Get
    $response.categories
}
