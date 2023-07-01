function Get-FREDSource {
    <#
    .SYNOPSIS
        Gets the sources of economic data.
    .DESCRIPTION
        Gets the sources of economic data.
    .PARAMETER SourceID
        The ID for a source.
    .EXAMPLE
        Get-FREDSource -SourceID 1
    .NOTES
        For more information, please refer to the official documentation - https://research.stlouisfed.org/docs/api/fred/source.html.
    .LINK
        https://research.stlouisfed.org/docs/api/fred/source.html
    #>
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [string]$SourceID
    )
    process {
        if ($SourceID) {
            $uri = "https://api.stlouisfed.org/fred/source?source_id=$SourceID&api_key=$($global:apiKey)&file_type=json"
        }
        else {
            $uri = "https://api.stlouisfed.org/fred/source?api_key=$($global:apiKey)&file_type=json"
        }
        $response = Invoke-RestMethod -Uri $uri -Method Get
        $response
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUctoiiK0ZXBG2JZ9buHuOdw9Q
# OQygggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUkdmsD4X7gb8mHjD9RQ4y
# TXEeVxMwDQYJKoZIhvcNAQEBBQAEggEApQrJs+RPOsfvPrGE+Sk9Rz85N12ynVov
# 99nB65lJBYEYBdJS9lUPlRIGf3dfsQIH5cFk6UFaLbI47AMSJx6ehuA/JXSH6Ljw
# w3rd4nsx2shPTJ0CD2WiRWmqAoLHbIivkDpyaFw4SRzspNcmu5RuJ7IVqFKAD7BN
# mvC33WMG4Ui3DMdv3QAT8HbnyYHy9jkbLODHS2N98LkXzGN7927OgXG49NBGhb98
# jNYYnMC32fSAMurAaz2Qbl7Gju4aGAtkHMoaJpvjVNLpMThgXBvohWsocV4gfiJS
# hRSVfdivvnsKt0cQIgCC6GuSSyftJxrXkreyBp0dy9C6aDs9+H4Fng==
# SIG # End signature block
