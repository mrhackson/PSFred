$ModuleFolder = Split-Path $PSCommandPath -Parent

$Scripts = Join-Path -Path $ModuleFolder -ChildPath 'scripts'
$Functions = Join-Path -Path $ModuleFolder -ChildPath 'functions'

#Write-Information -MessageData "Scripts Path  = $Scripts" -InformationAction Continue
#Write-Information -MessageData "Functions Path  = $Functions" -InformationAction Continue

$Script:ModuleFiles = @(
  #Generate code to load functions
  ###Get-ChildItem functions | select -ExpandProperty Name | %{'$(Join-Path -Path $functions -ChildPath "' + $_ + '")'} | clip
  
  # Load Functions
  $(Join-Path -Path $functions -ChildPath 'Get-FREDCategory.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FredCategoryChildren.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FredCategoryRelated.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDCategoryRelatedTags.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDCategorySeries.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDCategoryTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDRelatedTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDRelease.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseDate.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseRelatedTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleases.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleasesDates.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseSeries.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseSource.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseTable.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDReleaseTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeries.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesCategories.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesObservations.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesRelease.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesSearch.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesSearchRelatedTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesSearchTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesUpdates.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSeriesVintagedates.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSource.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSourceReleases.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDSources.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDTag.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-FREDTagSeries.ps1')
  $(Join-Path -Path $functions -ChildPath 'Get-MyFREDAPIKey.ps1')
  $(Join-Path -Path $functions -ChildPath 'Set-MyFREDAPIKey.ps1')

  $(Join-Path -Path $Scripts -ChildPath 'Initialize.ps1')
)
foreach ($f in $ModuleFiles) {
  . $f
}

#>
