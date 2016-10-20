# Configures Nano Server for DSC

powershell_script 'install Nuget package provider' do
  code 'Install-PackageProvider -Name NuGet -Force'
  not_if '(Get-PackageProvider -Name Nuget -ListAvailable -ErrorAction SilentlyContinue) -ne $null'
end

powershell_script 'configure NanoServerPackage' do
  code 'Save-Module -Path "$env:ProgramFiles\WindowsPowerShell\Modules" -Name NanoServerPackage -MinimumVersion 1.0.0.0'
  not_if '(Get-Package Microsoft-NanoServer-DSC-Package -list) -ne $null'
end

powershell_script 'install Nano DSC package' do
  code 'Import-PackageProvider NanoServerPackage; Install-Package -Name Microsoft-NanoServer-DSC-Package -provider NanoServerPackage -Force'
  not_if '(Get-Package Microsoft-NanoServer-DSC-Package -list) -ne $null'
end
