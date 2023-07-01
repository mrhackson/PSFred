@{
    # If authoring a script module, the RootModule is the name of your .psm1 file
    RootModule           = 'PSFred.psm1'

    Author               = 'MrHackson'

    CompanyName          = 'Hackson Enterprises'

    ModuleVersion        = '0.1'

    # Use the New-Guid command to generate a GUID, and copy/paste into the next line
    GUID                 = 'e0da4aed-de01-4a68-8377-3642ae77b730'

    Copyright            = '2023 Hackson Enterprises'

    Description          = 'Get economic data from Fred API'

    # Minimum PowerShell version supported by this module (optional, recommended)
    # PowerShellVersion = ''

    # Which PowerShell Editions does this module work with? (Core, Desktop)
    CompatiblePSEditions = @('Desktop', 'Core')

    # Which PowerShell functions are exported from your module? (eg. Get-CoolObject)
    ###function StringifyArray{param([array]$Array)"@('" + $($array -join "', '") + "')"};StringifyArray (Get-ChildItem functions -recurse -include '*.ps1' | select -ExpandProperty BaseName) | clip
    FunctionsToExport    = @('Get-MyFREDAPIKey', 'Set-MyFREDAPIKey', 'Get-FREDCategory', 'Get-FredCategoryChildren', 'Get-FredCategoryRelated', 'Get-FREDCategoryRelatedTags', 'Get-FREDCategorySeries', 'Get-FREDCategoryTag', 'Get-FREDRelease', 'Get-FREDReleaseDate', 'Get-FREDReleaseRelatedTag', 'Get-FREDReleases', 'Get-FREDReleasesDates', 'Get-FREDReleaseSeries', 'Get-FREDReleaseSource', 'Get-FREDReleaseTable', 'Get-FREDReleaseTag', 'Get-FREDSeries', 'Get-FREDSeriesCategories', 'Get-FREDSeriesObservations', 'Get-FREDSeriesRelease', 'Get-FREDSeriesSearch', 'Get-FREDSeriesSearchRelatedTag', 'Get-FREDSeriesSearchTag', 'Get-FREDSeriesTag', 'Get-FREDSeriesUpdates', 'Get-FREDSeriesVintagedates', 'Get-FREDSource', 'Get-FREDSourceReleases', 'Get-FREDSources', 'Get-FREDRelatedTag', 'Get-FREDTag', 'Get-FREDTagSeries')

    # Which PowerShell aliases are exported from your module? (eg. gco)
    AliasesToExport      = @('')

    # Which PowerShell variables are exported from your module? (eg. Fruits, Vegetables)
    VariablesToExport    = @('')

    # PowerShell Gallery: Define your module's metadata
    PrivateData          = @{
        PSData = @{
            # What keywords represent your PowerShell module? (eg. cloud, tools, framework, vendor)
            Tags         = @('cooltag1', 'cooltag2')

            # What software license is your code being released under? (see https://opensource.org/licenses)
            LicenseUri   = ''

            # What is the URL to your project's website?
            ProjectUri   = ''

            # What is the URI to a custom icon file for your project? (optional)
            IconUri      = ''

            # What new features, bug fixes, or deprecated features, are part of this release?
            ReleaseNotes = @'
'@
        }
    }

    # If your module supports updatable help, what is the URI to the help archive? (optional)
    # HelpInfoURI = ''
}
# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUYu8jFZTy/XfqQZUqIMpRKfpe
# Ov+gggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUMmHos728L1H8yvmtPw/W
# BNz1rW8wDQYJKoZIhvcNAQEBBQAEggEAG3SBHEprDgkpgm3oWmzStATd2ajDyhIy
# RIgwOC4/fmGAEVrzyl42q0pdyJ9MtuMKJyPRjQjzAMe7eHAXGeobGxcn/u9r5t9N
# gSe1gLjLZ5+KMW21otYsumx7EX0wNLsH3WlObGDclqaleJb02Te+sX/GtKLnVt3r
# QetOpNNeMNvVmlWK0NE3d2buARE1M5P3zKVmFC9eWSwmQj5xOdSd2kUmBxB6SP1V
# cZ9SyVWawh3qG59pDb0Kg0IAX4eQV90Q/P5Og0hdM9S5C8Vfb5zEx1ZHsNon0iiI
# dqquUqNaQcE4zAR/+vFpRircnoiCr9JvCxUbS3aVjxkIl/aiuFltbg==
# SIG # End signature block
