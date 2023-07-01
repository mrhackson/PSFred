function Get-FREDSeriesSearch {
    <#
    .SYNOPSIS
        Get series that match keywords.
    .DESCRIPTION
        Get series that match keywords.
    .PARAMETER SearchText
        The words to match against economic data series search. For example, "money stock" returns all series that have the words "money" and "stock" in the series name, description, or release.
    .PARAMETER SearchType
        Determines the type of search to perform. Search terms are matched only against series names if type is set to "full_text", only against series IDs if type is set to "series_id", and against series IDs and names if left blank.
    .PARAMETER RealTimeStart
        The start of the real-time period. See the realtime_start and realtime_end fields in the release table for more details. The realtime_start field corresponds to the observation period of the most recently released real-time dataset.
    .PARAMETER RealTimeEnd
        The end of the real-time period. See the realtime_start and realtime_end fields in the release table for more details. The realtime_end field corresponds to the observation period of the most recently released real-time dataset.
    .PARAMETER Limit
        The maximum number of results to return.
    .PARAMETER Offset
        Non-negative integer. Excludes the first <offset> results.
    .PARAMETER OrderBy
        Order results by values of the specified attribute. One attribute can be specified for ascending order and another for descending order. The syntax is "attribute_name1,attribute_name2". For example, "popularity,series_id" sorts by popularity in ascending order then by series ID in ascending order.
    .PARAMETER SortOrder
        Sort results is ascending or descending order for attribute values specified by order_by. Values are asc for ascending order and desc for descending order.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SearchText,
        [Parameter(Mandatory = $false)]
        [ValidateSet('full_text', 'series_id')]
        [string]$SearchType,
        [Parameter(Mandatory = $false)]
        [ValidatePattern('^\d{4}-\d{2}-\d{2}$')]
        [string]$RealTimeStart,
        [Parameter(Mandatory = $false)]
        [ValidatePattern('^\d{4}-\d{2}-\d{2}$')]
        [string]$RealTimeEnd,
        [Parameter(Mandatory = $false)]
        [ValidateRange(1, 1000)]
        [int]$Limit,
        [Parameter(Mandatory = $false)]
        [ValidateRange(0, 1000)]
        [int]$Offset,
        [Parameter(Mandatory = $false)]
        [ValidateSet('popularity', 'series_id', 'title', 'units', 'frequency', 'seasonal_adjustment', 'realtime_start', 'realtime_end', 'last_updated', 'observation_start', 'observation_end', 'popularity', 'group_popularity')]
        [string]$OrderBy,
        [Parameter(Mandatory = $false)]
        [ValidateSet('asc', 'desc')]
        [string]$SortOrder
    )
    #Create the URI
    $uri = $fredapiuri + '/series/search?search_text=' + $SearchText + '&api_key=' + $fredapikey + '&file_type=json'
    if ($SearchType -ne $null) {
        $uri += '&search_type=' + $SearchType
    }
    if ($RealTimeStart -ne $null) {
        $uri += '&realtime_start=' + $RealTimeStart
    }
    if ($RealTimeEnd -ne $null) {
        $uri += '&realtime_end=' + $RealTimeEnd
    }
    if ($Limit -ne $null) {
        $uri += '&limit=' + $Limit.ToString()
    }
    if ($Offset -ne $null) {
        $uri += '&offset=' + $Offset.ToString()
    }
    if ($OrderBy -ne $null) {
        $uri += '&order_by=' + $OrderBy
    }
    if ($SortOrder -ne $null) {
        $uri += '&sort_order=' + $SortOrder
    }
    try {
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the series
        $response.seriess
    }
    catch {
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeriesSearch: $_"
    }    
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUzCuqDbSbrwa/+S6OIbNYQWlJ
# GRGgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUV78YsCmCLSi250n1+p8l
# 7FjPq6IwDQYJKoZIhvcNAQEBBQAEggEAjmLoi7FBrUbWGuP2KAxER8KFnn7oj+Jb
# 0YxTadlVKzDv1vYRwm/+spIUtVDnCMwj+naZfgKkH94huClINtFd+CybThiWUGs8
# JC5dS1Ey1swgrnbK2f73TKvtSnh2PUl7yTcTZ4SCaJMVXYq/sMDF7zjMhmhZtfZD
# QVevDQyNFPdvrH8hEWfOFISf5mjPyjDx+8JP1dtGMq/RioqNk9QXW5UEvFqkhrQc
# 1yo/MSn79wHoph4bCeKYsF/lsWRgoczcKe7rox4Sbp6FA9pkfALxG74tNeHFsAw1
# oiE2mR80EOnWGFnLSbRqC3dXqR/qGTdBKfj7YPOpnHZuE53ZDcGDBA==
# SIG # End signature block
