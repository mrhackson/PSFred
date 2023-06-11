$ModuleFolder = Split-Path $PSCommandPath -Parent

$Scripts = Join-Path -Path $ModuleFolder -ChildPath 'scripts'
$Functions = Join-Path -Path $ModuleFolder -ChildPath 'functions'

#Write-Information -MessageData "Scripts Path  = $Scripts" -InformationAction Continue
#Write-Information -MessageData "Functions Path  = $Functions" -InformationAction Continue

$Script:ModuleFiles = @(
  #Generate code to load functions
  ###Get-ChildItem functions | select -ExpandProperty Name | %{'$(Join-Path -Path $functions -ChildPath "' + $_ + '")'} | clip
  
  # Load Functions
  $(Join-Path -Path $functions -ChildPath "Get-FREDCategory.ps1")
  $(Join-Path -Path $functions -ChildPath "Get-MyFREDAPIKey.ps1")
  $(Join-Path -Path $functions -ChildPath "Set-MyFREDAPIKey.ps1")

  $(Join-Path -Path $Scripts -ChildPath 'Initialize.ps1')
)
foreach ($f in $ModuleFiles) {
  . $f
}

#>
