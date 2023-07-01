#Requires -Version 5.1
###############################################################################################
# Module Variables
###############################################################################################
$ModuleVariables = @{
    'FREDAPIURI'            = 'https://api.stlouisfed.org/fred'
    'FREDAPIKey'     = Get-MyFREDAPIKey
  }
  
  $ModuleVariables.getenumerator().ForEach( { Set-Variable -Scope Script -Name $_.name -Value $_.value })
  #enum #name { #value; #value }
  
  ###############################################################################################
  # Module Removal
  ###############################################################################################
  #Clean up objects that will exist in the Global Scope due to no fault of our own . . . like PSSessions
  
  $OnRemoveScript = {
    # perform cleanup
    Write-Verbose -Message 'Removing Module Items from Global Scope'
  }
  
  $ExecutionContext.SessionState.Module.OnRemove += $OnRemoveScript
# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU2ZkSweUJAXtT9d+TD80FPG1G
# JkqgggMiMIIDHjCCAgagAwIBAgIQUeZaH8Iy/KNCFtQTYggggTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUi6ULDvmjIjffvwXAGPpa
# aI9P2t8wDQYJKoZIhvcNAQEBBQAEggEAoHIi9WYMAMaz6xmF5Jv4RYMzwulxeGEc
# MjUDeCKNrXSAXThVlVfiBT5fRQ4PFvo5AncfmEK2qTS4e7Jd4BMQnO4kG5C4xlN9
# eE0GUMp2Qc+TgM1/qHAIsBEMoKpHPCYw7Jgcfp67V1C8+b8W8n5QUoQQail2RmF1
# e2xJWdBx2nOFqgZa8hF+UtSjhNAPu1/dQm11/AV/GEXwlE9hThQn1z9ewPvKGQW9
# RJirmpm4z2B7DQyj0MSwmSIO1KVxPFCnHYiNgezVjSUCS1BjwF2PUBzQAXQ0fcE5
# cfpYflTEl6g09o84MtCWtoP8I75YtH6LVEtMzl+aacuTAGJix9Rv1Q==
# SIG # End signature block
