$cert = Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert | Select-Object -First 1

$ModuleFolder = Split-Path -Path (Split-Path $PSCommandPath -Parent) -Parent

$Functions = Join-Path -Path $ModuleFolder -ChildPath 'functions'
$functions = Get-ChildItem $Functions -Recurse -Include '*.ps1' | Select-Object -ExpandProperty FullName

foreach ($File in $functions) {
    Set-AuthenticodeSignature -FilePath $File -Certificate $cert
}

$Scripts = Join-Path -Path $ModuleFolder -ChildPath 'scripts'
$Scripts = Get-ChildItem $Scripts | Select-Object -ExpandProperty FullName

foreach ($File in $scripts) {
    Set-AuthenticodeSignature -FilePath $File -Certificate $cert
}

$ModuleScript = Join-Path -Path $ModuleFolder -ChildPath 'PSFred.psm1'
Set-AuthenticodeSignature -FilePath $ModuleScript -Certificate $cert

$moduleManifest = Join-Path -Path $ModuleFolder -ChildPath 'PSFred.psd1'
Set-AuthenticodeSignature -FilePath $moduleManifest -Certificate $cert