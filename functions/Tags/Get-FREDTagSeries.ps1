function Get-FREDTagSeries {
    <#
    .SYNOPSIS
        Gets the series matching tags.
    .DESCRIPTION
        Gets the series matching tags.
    .PARAMETER TagNames
        The names of one or more tags.
    .PARAMETER TagGroupID
        The ID for a tag group.
    .PARAMETER SearchText
        The words to match against economic data series names, descriptions, and tags.
    .PARAMETER RealTimeStart
        The start of the real-time period.
    .PARAMETER RealTimeEnd
        The end of the real-time period.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset of the first result.
    .PARAMETER OrderBy
        Order results by values of the specified attribute.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by the orderby parameter.
    .EXAMPLE
        Get-FREDTagSeries -TagNames "monetary aggregates" -Limit 10
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/series_search.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/series_search.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string[]]$TagNames,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$TagGroupID,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SearchText,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [datetime]$RealTimeStart,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [datetime]$RealTimeEnd,
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
        [string]$OrderBy,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SortOrder
    )
    process {
        $uri = 'https://api.stlouisfed.org/fred/series/search?tag_names={0}&api_key={1}&file_type=json' -f $TagNames, $env:FRED_API_KEY
        if ($TagGroupID) {
            $uri += "&tag_group_id=$TagGroupID"
        }
        if ($SearchText) {
            $uri += "&search_text=$SearchText"
        }
        if ($RealTimeStart) {
            $uri += "&realtime_start=$RealTimeStart"
        }
        if ($RealTimeEnd) {
            $uri += "&realtime_end=$RealTimeEnd"
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
        $response = Invoke-RestMethod -Uri $uri
        $response.seriess
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUmDH/CVOQ7vA1WTookysxxZuv
# o8+gggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUSIqt06rdYLcGtY+alDa0
# HtDGx14wDQYJKoZIhvcNAQEBBQAEggEABF++0LSMCAUnk/fkmScxsowE2RCY30UW
# lGc+JEGAhOuq+/CXfPbxnylKBjXkCrJVdquvOj1OaSQ23AZ2wtZ091Oz+flTFGEt
# npj6woEafrp+sP7wD3v5pnxRkjZwBGqDYVA45A3cqjdQO8u7RYROJBEwr6RoM74S
# bjm+9+lQwLPeB2feP9IwNUNIjMeSkegSuhEuSHw69yKv4o92kUSyiWfLP+T/3JdQ
# 6Wj7ACRyEA+2UrDAOpAzEzjav72FRDFILLC13EP3N+xX7tTDzzfKHimTBIf6S9re
# Fj+YmhFpeTwoXsvPJ4oS6UlH5bNIDudI+f7gNjfLWu+ByR/LV3ncOw==
# SIG # End signature block
