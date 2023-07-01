function Get-FREDSeriesSearchRelatedTag {
    <#
    .SYNOPSIS
        Gets the related tags for a series search.
    .DESCRIPTION
        Gets the related tags for a series search.
    .PARAMETER SearchText
        The words to match against economic data series.
    .PARAMETER TagNames
        The names of tags to match against series.
    .PARAMETER TagGroupId
        The ID for a tag group.
    .PARAMETER SearchType
        Indicates the type of text match for the series search.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset of the first result.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by orderby.
    .EXAMPLE
        Get-FREDSeriesSearchRelatedTag -SearchText "monetary service index"
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/related_tags.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/related_tags.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SearchText,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string[]]$TagNames,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$TagGroupId,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('full_text', 'series_id_only')]
        [string]$SearchType,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [int]$Limit,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [int]$Offset,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('series_count', 'popularity', 'created', 'name')]
        [string]$OrderBy,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/related_tags?search_text=$SearchText&api_key=$($global:apiKey)&file_type=json"
        if ($TagNames) {
            $uri += "&tag_names=$($TagNames -join ',')"
        }
        if ($TagGroupId) {
            $uri += "&tag_group_id=$TagGroupId"
        }
        if ($SearchType) {
            $uri += "&search_type=$SearchType"
        }
        if ($Limit) {
            $uri += "&limit=$Limit"
        }
        if ($Offset) {
            $uri += "&offset=$Offset"
        }
        if ($OrderBy) {
            $uri += "&order_by=$OrderBy"
        }
        if ($SortOrder) {
            $uri += "&sort_order=$SortOrder"
        }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response       
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU3BosnZmur/rBSXScny+GbVjI
# MaKgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MB4X
# DTIzMDcwMTE3MjAyMloXDTI0MDcwMTE3NDAyMlowJzElMCMGA1UEAwwcUG93ZXJT
# aGVsbCBDb2RlIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBAK6BCP8DKCbc95XAB0ISuRoaX5N3jHYl95N0HsVwzsAHYFxzc2P83XU7
# 6xRCFJCdebSqB2cRJu12SwBHyZe551i7549W1SqIG/pkVmR92VbKqpLBGKC1koYz
# +JuwMjIacYwdzhS8jrKccZxmytMcuuKElFgqdlE6UEBuBDL3+YF38Qhyi02ezzZK
# DybNT6UzH996dou2sMJ+c3HuyfZb3i+38sF4Oyd7/K+G09vnJ8y+Qpw/mbCM3l/F
# cFplCzWXTpFtC8amj8dKOMh5zabgXJPWXOYVt9hgueJMueOw9TveVjTJyZHKZHQp
# NlRzY8JIZtOLPAXpPGVruDhfaUmbc9UCAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBT/32th6fZXwd9ztJYJMhDA
# F0h/vTANBgkqhkiG9w0BAQsFAAOCAQEAQyitMQhAtIOWiP/hokfK1hpAqTo8116m
# MwxIUluUGcFpdnpRpU+Z2nZKSG1fSgPFkyXH59aZWZVnjmccnxfsGfkF3P/Q47z2
# WRWXl/vGEtom9T0wDWz/pOgQeH16iwGM1WCYFmnqHjQ2APleJWP8rtR5qp9eTPz9
# p/I5sOmOcIVOHJ9hu80RxMYoG5iYeUGnYAZajZyt+FqR+jhuMXf/lmj+MDIXwRRZ
# MOGzImSp6IsdOMaxjd4rbdwlwntnYN4B6jW7FdHZBoh4bQxaSOcZ+2kMIiyGnq14
# CPV7g5xRK9RhGORuJiHKH6vDUrG/YwGmRj7A57uq+YGCcGSaimE9CTGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcUG93ZXJTaGVsbCBDb2RlIFNpZ25pbmcgQ2VydAIQ
# UeZaH8Iy/KNCFtQTYggggTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUXbE8LztdIWkGppoFePdZ
# pm8UgMYwDQYJKoZIhvcNAQEBBQAEggEAKlgg8uQGG4u+Z7N4qSorm3ZBRrPE4cpA
# hdu6mJwzEL+lUOUZnF9XFeLj6klQbhDKcjDHRtuTtOMhtwfUlnW/AGUwigT8pUve
# jSYEWxbg1zLgBJ2a9dK5sITVV6JbA04V9J0zneinX7BiGZ6ubeud2RcmWdtZWIYT
# G2uobziE5G8wjg/wrrZhyA8oEW8IT4tVMaguzl52Ag8o1ZZre9yp42emnyIZ+YKT
# MW7hEVF3Ygre7hOcKyIFwoZEgKXP9nFm7xoQF79/dSS16IWc4gV35RTSI173k0dO
# 8MgFfM67kUJOiTA2NK36BfsPXeyRwdV+IF+7xvAJzQM4jxG+LbJ3/g==
# SIG # End signature block
