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

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUIn5y/IwfhfUsL5Mtmp6CYURo
# 8FKgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUL/CmzF46uqV5+Ryi63Dr
# Zvo2QqgwDQYJKoZIhvcNAQEBBQAEggEADxnMD9yd0p6zVEFtsSVVzsxJ5XsQZM/E
# AGya9z9Sr2fJF1F3bt30LlWmKhtMNe2EoyIjKriI7CBWtR6Y2JfpCPBVEQRMOdC5
# kGHDvNBcvKZoa3jReJ9vHLqT5M9XDMf/SBYPHfq1ZPnMPokD/jOAFUkFmTBGt7Zf
# FYvBy1rMcHAGq/61TN/gAWkcvdh3TSP0j+RNNK2fUsMd1U0be8SgDngkGUMFvDkc
# K7ijFg09rPKGZMoUwTISIxcx5KhmSksz+vvYoyqJy0sAsa0awnGdyjSfwJVF7Ulk
# r+1Gph5d/WaXoqL8OUYKTZQrfrjr4GtKUa1uZaRoMepGYoek6CNoJA==
# SIG # End signature block
