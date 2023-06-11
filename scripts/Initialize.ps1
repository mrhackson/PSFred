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