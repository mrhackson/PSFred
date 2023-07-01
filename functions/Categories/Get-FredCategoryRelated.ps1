Function Get-FredCategoryRelated{
    #Returns a list of categories to which the category has been related
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, position=0)]
        [ValidateNotNullOrEmpty()]
       [string]$categoryid
    )
    #Create the URI
    $uri = $fredapiuri + "/category/related?category_id=" + $categoryid + "&api_key=" + $fredapikey + "&file_type=json"
    try{
        #Make the web request
        $response = Invoke-RestMethod -Uri $uri -Method Get
        #Return the categories
        $response.categories
    }
    catch{
        #If there was an error, write it to the error stream
        Write-Error -Message "Error in function Get-FredCategoryRelated: $_"
    }
}
# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUL3NdC38+Jig1BgppM/3WX/by
# KJKgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUqne0ffUwIRDowncHs0cT
# BcqegkUwDQYJKoZIhvcNAQEBBQAEggEAEtf26E1rZYYx606lG6fd8EOALs6ka6Ge
# KrT3Ns429aW9njVn0NqF971KluRNwTd7Wus1934QFszE7nSYv0aFzhtp4fluYSqt
# RdAgNd7YLaY/zK4tX2psiTNw/yc5oLkYRZPyryAxg4MOFFyoMX2RT3mDBvGuzOkN
# 2jhcjVp9nR3VnrbNlm3n6ngCvRr6MGp0joz5pXk/jjY4Uo9tAvNs4Ka58k5qMIyb
# zLZWLqpkLxvPOpplpSYMHgPCXQUspjm7zx1bPL6MNKWzDh4lnqb7AgVZTZV+1Ujl
# mOswuMRAQPNgtZvi5lSh66lfd33dkHZZ5TnMSMM4YHKXapfg9J43fQ==
# SIG # End signature block
