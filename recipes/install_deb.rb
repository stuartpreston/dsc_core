# Installs OMI, DSC and PowerShell 6 on .deb platforms

# Install OMI

remote_file '/tmp/omi-1.1.0.ssl_100.x64.deb' do
  source 'https://github.com/Microsoft/omi/releases/download/v1.1.0-0/omi-1.1.0.ssl_100.x64.deb'
  mode 0700
end

dpkg_package 'omi' do
  source '/tmp/omi-1.1.0.ssl_100.x64.deb'
  action :install
end

# Install DSC

remote_file '/tmp/dsc-1.1.1-294.ssl_100.x64.deb' do
  source 'https://github.com/Microsoft/PowerShell-DSC-for-Linux/releases/download/v1.1.1-294/dsc-1.1.1-294.ssl_100.x64.deb'
  mode 0700
end

dpkg_package 'dsc' do
  source '/tmp/dsc-1.1.1-294.ssl_100.x64.deb'
  action :install
end

# Install PowerShell

remote_file '/tmp/powershell_6.0.0-alpha.11-1ubuntu1.14.04.1_amd64.deb' do
  source 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.11/powershell_6.0.0-alpha.11-1ubuntu1.14.04.1_amd64.deb'
  mode 0700
end

apt_package %w(libunwind8 libicu52) do
  action :install
end

dpkg_package 'powershell' do
  source '/tmp/powershell_6.0.0-alpha.11-1ubuntu1.14.04.1_amd64.deb'
  action :install
end
