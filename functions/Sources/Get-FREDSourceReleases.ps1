function Get-FREDSourceReleases {
    <#
    .SYNOPSIS
        Gets all releases of economic data sources.
    .DESCRIPTION
        Gets all releases of economic data sources.
    .PARAMETER FileType
        A file type, either xml or json.
    .PARAMETER SourceID
        The ID for a source.
    .PARAMETER RealtimeStart
        The start of the real-time period.
    .PARAMETER RealtimeEnd
        The end of the real-time period.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        The offset number of results to skip.
    .PARAMETER SortOrder
        Sort results is ascending or descending order (default: asc).
    .EXAMPLE
        Get-FREDSourceReleases
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/source_releases.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/source_releases.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param(
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $FileType = 'json',
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $SourceID,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $RealtimeStart,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $RealtimeEnd,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Limit,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $Offset,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $SortOrder,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        $OrderBy
    )
    process {
        $uri = "https://api.stlouisfed.org/fred/source_releases?api_key=$($global:apiKey)&file_type=$FileType"
        if ($SourceID) { $uri += "&source_id=$SourceID" }
        if ($RealtimeStart) { $uri += "&realtime_start=$RealtimeStart" }
        if ($RealtimeEnd) { $uri += "&realtime_end=$RealtimeEnd" }
        if ($Limit) { $uri += "&limit=$Limit" }
        if ($Offset) { $uri += "&offset=$Offset" }
        if ($SortOrder) { $uri += "&sort_order=$SortOrder" }
        if ($OrderBy) { $uri += "&order_by=$OrderBy" }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUqHBVZTeobWrLvyh3/DcirJ0d
# RDegggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUbrq2o9CmP1dDoLupkzK8
# q1b/zE4wDQYJKoZIhvcNAQEBBQAEggEAYj6Ge+Y7RZHwHhyx3HWj5Dr+cjh5Ahjv
# IXDnLiWq9PJPEXE21t7g0l02yTZscByDVQAP/Pc30nLSub6z5YLfcRzi2zrJfI89
# 1zPzLHi8NpFzLoPAd/foFwB89Y5J2vP325Ri7gMlz7I/psrKib/y14fMB4zCOsDn
# jRIQXB+d/RzTENJHOtPW+AzLhOClsYe6S4vr6CdAfPnwOAjs3k6AH2SQvKMZJD2D
# 1a4M3+1o0S08OtndPBYka0Lt6RCsFgk12py400YLr1A/9ScLYAebYrD2BshpsZfq
# WsBy+hSJs0SSW9YJmvsKV7v6w/A1Gq8LjjTbvc0uKpnaVajCAg9aXA==
# SIG # End signature block
