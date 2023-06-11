Function Get-FredCategory {
    <#
    .SYNOPSIS
        Get a category.
    .DESCRIPTION
        Get a category.
    .PARAMETER categoryid
        The id for a category.
    .EXAMPLE
        Get-FredCategory -categoryid 125
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/category.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/category.html
        #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$categoryid
    )
    $uri = $fredapiuri + '/category?category_id=' + $categoryid + '&api_key=' + $fredapikey + '&file_type=json'
    $response = Invoke-RestMethod -Uri $uri -Method Get
    if ($response.status -eq 200) {
        $response.categories
    }
    else {
        Write-Error "Error getting category: $($response.message)"
    }
}
