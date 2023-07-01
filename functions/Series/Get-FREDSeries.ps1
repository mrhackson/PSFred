function Get-FREDSeries {
    <#
    .SYNOPSIS
        Get an economic data series.
    .DESCRIPTION
        Get an economic data series.
    .PARAMETER SeriesID
        The series ID
    .PARAMETER filetype
        The file type to return. Valid values are xml and json.
    .PARAMETER realtimestart
        The start of the real-time period.
    .PARAMETER realtimeend
        The end of the real-time period.
    .LINK
        https://fred.stlouisfed.org/docs/api/fred/series.html
    .EXAMPLE
        Get-FREDSeries -SeriesID "GNPCA"
    .EXAMPLE
        Get-FREDSeries -SeriesID "GNPCA" -filetype "xml"
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$SeriesID,
        [Parameter(Mandatory = $false, position = 1)]
        [ValidateSet('xml', 'json')]
        [string]$filetype = 'json',
        [Parameter(Mandatory = $false, position = 2)]
        [datetime]$realtimestart,
        [Parameter(Mandatory = $false, position = 3)]
        [datetime]$realtimeend
    )
    #Create the URI
    $uri = $fredapiuri + '/series?series_id=' + $SeriesID + '&api_key=' + $fredapikey + '&file_type=json'
    if ($realtimestart -ne $null) {
        $uri += '&realtime_start=' + $realtimestart.ToString('yyyy-MM-dd')
    }
    if ($realtimeend -ne $null) {
        $uri += '&realtime_end=' + $realtimeend.ToString('yyyy-MM-dd')
    }
    try {
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the series
        $response.seriess
    }
    catch {
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeries: $_"
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUoEGT43Yp8iPniTeeieD9hzip
# Y8OgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUJAnWWpjVrG5Hh27XSfwZ
# hDpZDt8wDQYJKoZIhvcNAQEBBQAEggEAVP+G99IcgBtiW7Z7PcQMj1uHm8QLUR8O
# xpoaVzfQ5kD136yCpiDmRRwo+A+6pCWAfXQc78zlm1PWkBrTN0uEjmIZc1IstqSF
# fmTk8kceuJPtUO+5Ok0x2jeT4QM/StBuaaTYXccb21KfVP56XBMvgTSDn4v6aKQh
# 5bviTexflAdle7EQZb4/3QKEtiorOdgGyKliMmvMpBh5Cef7uFKh2L3aNmMlVKkq
# /VFevxIb9I41liPfN6mq5xUkDA6gK8nneR4g1LyGFa3WdhyKTF8Hqy2WrPgn4I/4
# hdwvpMf6IC/aIRGSDYlOc1IsKzU1ZWwhRxTYM8Dx46TZPBE/hMPVIA==
# SIG # End signature block
