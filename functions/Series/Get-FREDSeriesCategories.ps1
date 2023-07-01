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

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUiMNDJ6T2jtXUkieh01KmmE9/
# H3GgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUEZWk/CEBbrnMtzx4Sngp
# iTnAYRAwDQYJKoZIhvcNAQEBBQAEggEAEmKgWI7tqKJI5f6MqF9KOuSbaAYi9OUM
# g5w/SmplfPgxTlef4gmR0gxJuxAtFTDKzGcpcotKB4bpz//awHBQWv0rrP6KqM1o
# dycRYyDhzI7hdti9PIjCuWtQAKll282Gx0NHoPX/kn9IbPQA44nCQnaXkfyfFu+H
# 0Y5BG1ox/kOWJSsXiz+kiLmWawWSX0Iqs5nYqFCt5rYi1Ic13VVUwBVJzOncMwBX
# v1B83ZhgPoXNtQmpknQqOz+iE37JGzYxGCj5OHHzE2b2von2RHJT/J4CWj1aE3v2
# OFXV6BD9k82hgU89AcoIhEYs4PcFZ6YF7BDzWMh11xMSTESVpNPpWw==
# SIG # End signature block
