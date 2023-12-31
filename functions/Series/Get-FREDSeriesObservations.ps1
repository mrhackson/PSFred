function Get-FREDSeriesObservation {
    <#
    .SYNOPSIS
        Get the observations or data values for an economic data series.
    .DESCRIPTION
        Get the observations or data values for an economic data series.
    .PARAMETER SeriesID
        The series ID
    .PARAMETER filetype
        The file type to return. Valid values are xml and json.
    .PARAMETER realtimestart
        The start of the real-time period.
    .PARAMETER realtimeend
        The end of the real-time period.
    .PARAMETER sortorder
        Sort results is ascending or descending observation_date order. Valid values are asc and desc.
    .PARAMETER observationstart
        The observation date to begin with.
    .PARAMETER observationend
        The observation date to end with.
    .PARAMETER units
        The units of the observations. Valid values are lin, chg, ch1, pch, pc1, pca, cch, cca, and log.
    .PARAMETER frequency
        The frequency of the observations. Valid values are d, w, bw, m, q, sa, a, wef, weth, wew, wetu, wem, wesu, wesa, bwew, and bwem.
    .PARAMETER aggregationmethod
        The aggregation method of the observations. Valid values are avg, sum, eop, and CEO.
    .PARAMETER outputtype
        The output type of the observations. Valid values are 1, 2, and 3.
    .PARAMETER vintagedates
        The vintage dates of the observations. Multiple vintage dates can be separated by commas.
    .LINK
        https://fred.stlouisfed.org/docs/api/fred/series_observations.html
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -filetype "xml"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -realtimestart (Get-Date).AddDays(-30) -realtimeend (Get-Date)
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -sortorder "asc"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -observationstart (Get-Date).AddDays(-30) -observationend (Get-Date)
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -units "chg"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -frequency "m"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -aggregationmethod "avg"
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -outputtype 1
    .EXAMPLE
        Get-FREDSeriesObservation -SeriesID "GNPCA" -vintagedates "2017-01-01,2017-02-01"
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, position = 0, HelpMessage = 'The series ID')]
        [ValidateNotNullOrEmpty()]
        [string]$SeriesID,
        [Parameter(Mandatory = $false, position = 1, HelpMessage = 'The file type to return')]
        [ValidateSet('xml', 'json')]
        [string]$filetype = 'json',
        [Parameter(Mandatory = $false, position = 2, HelpMessage = 'The start of the real-time period')]
        [datetime]$realtimestart,
        [Parameter(Mandatory = $false, position = 3, HelpMessage = 'The end of the real-time period')]
        [datetime]$realtimeend,
        [Parameter(Mandatory = $false, position = 4, HelpMessage = 'Sort results is ascending or descending observation_date order')]
        [ValidateSet('asc', 'desc')]
        [string]$sortorder,
        [Parameter(Mandatory = $false, position = 5, HelpMessage = 'The observation date to begin with')]
        [datetime]$observationstart,
        [Parameter(Mandatory = $false, position = 6, HelpMessage = 'The observation date to end with')]
        [datetime]$observationend,
        [Parameter(Mandatory = $false, position = 7, HelpMessage = 'The units of the observations')]
        [ValidateSet('lin', 'chg', 'ch1', 'pch', 'pc1', 'pca', 'cch', 'cca', 'log')]
        [string]$units,
        [Parameter(Mandatory = $false, position = 8, HelpMessage = 'The frequency of the observations')]
        [ValidateSet('d', 'w', 'bw', 'm', 'q', 'sa', 'a', 'wef', 'weth', 'wew', 'wetu', 'wem', 'wesu', 'wesa', 'bwew', 'bwem')]
        [string]$frequency,
        [Parameter(Mandatory = $false, position = 9, HelpMessage = 'A key that indicates the aggregation method used for frequency aggregation. This parameter has no affect if the frequency parameter is not set.')]
        [ValidateSet('avg', 'sum', 'eop')]
        [string]$aggregationmethod,
        [Parameter(Mandatory = $false, position = 10, HelpMessage = 'The type of output. 1=observations, 2=observations with headings, 3=separated values format (csv), 4=full documentation for a series')]
        [ValidateRange(1, 4)]
        [int]$outputtype,
        [Parameter(Mandatory = $false, position = 11, HelpMessage = 'The date when vintage values were revised or new vintages were released, for a vintage series')]
        [datetime]$vintagedates
    )
    #Create the URI
    $uri = $fredapiuri + '/series/observations?series_id=' + $SeriesID + '&api_key=' + $fredapikey + '&file_type=json'
    if ($realtimestart -ne $null) {
        $uri += '&realtime_start=' + $realtimestart.ToString('yyyy-MM-dd')
    }
    if ($realtimeend -ne $null) {
        $uri += '&realtime_end=' + $realtimeend.ToString('yyyy-MM-dd')
    }
    if ($null -ne $limitstart) {
        $uri += '&limit_start=' + $limitstart.ToString('yyyy-MM-dd')
    }
    if ($null -ne $limitend) {
        $uri += '&limit_end=' + $limitend.ToString('yyyy-MM-dd')
    }
    if ($sortorder -ne $null) {
        $uri += '&sort_order=' + $sortorder
    }
    if ($observationstart -ne $null) {
        $uri += '&observation_start=' + $observationstart
    }
    if ($observationend -ne $null) {
        $uri += '&observation_end=' + $observationend
    }
    if ($units -ne $null) {
        $uri += '&units=' + $units
    }
    if ($frequency -ne $null) {
        $uri += '&frequency=' + $frequency
    }
    if ($aggregationmethod -ne $null) {
        $uri += '&aggregation_method=' + $aggregationmethod
    }
    if ($outputtype -ne $null) {
        $uri += '&output_type=' + $outputtype
    }
    if ($vintagedates -ne $null) {
        $uri += '&vintage_dates=' + $vintagedates
    }
    try {
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the series
        $response.observations
    }
    catch {
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FREDSeriesObservation: $_"
    }
}

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUO8OVoDjCsTY8TZVV/Khri0lU
# LBigggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUQkcR1pb41lUXnlJhVdl7
# nhLxetMwDQYJKoZIhvcNAQEBBQAEggEAYDPtDjYlLHyLulOTWO4O7YRc/mKMLZ6g
# TyGc/gAlNpm3Y8BPzPcaBZWXuOmcniBWc3HwGtXLWEbCbsyb9Yg/mGZCU50uetxK
# Iwh/L1HTGr0mFkm6BjNYh2b23CgZvozb8rv57ZicStvgpBVswJo2iygjtzwmxfpb
# iCgm1nz2kKP7oWjyxviQo+0ENLjMOrpT6hTsIBMOPqxPyo8OrVqLdfCvuLVUeCbb
# 7GMWfIXWi8cMfVlWh21vnY2qUIayFiZvoFVshyWWrLplLceOgMJRcu4Z5Fl5IMDA
# J2ZkAzaYiOUvAH0gkqKooU4A68NVdyrWN346gUm0G2cSpyE+2raw+A==
# SIG # End signature block
