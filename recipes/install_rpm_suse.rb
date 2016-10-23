# Installs OMI, DSC and PowerShell 6 on .deb platforms

# Install OMI

remote_file '/tmp/omi-1.1.0.ssl_100.x64.rpm' do
  source 'https://github.com/Microsoft/omi/releases/download/v1.1.0-0/omi-1.1.0.ssl_100.x64.rpm'
  mode 0700
end

rpm_package 'omi' do
  source '/tmp/omi-1.1.0.ssl_100.x64.rpm'
  action :install
end

# Install DSC

remote_file '/tmp/dsc-1.1.1-294.ssl_100.x64.rpm' do
  source 'https://github.com/Microsoft/PowerShell-DSC-for-Linux/releases/download/v1.1.1-294/dsc-1.1.1-294.ssl_100.x64.rpm'
  mode 0700
end

rpm_package 'dsc' do
  source '/tmp/dsc-1.1.1-294.ssl_100.x64.rpm'
  action :install
end

# Install PowerShell

remote_file '/tmp/powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm' do
  source 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.11/powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm'
  mode 0700
end

rpm_package 'powershell' do
  source '/tmp/powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm'
  action :install
end

execute 'remove local libmi.so' do
  command 'sudo rm -f /opt/microsoft/powershell/6.0.0-alpha.11/libmi.so'
  action :run
end

execute 'link OMI libmi.so to PowerShell location' do
  command 'sudo ln -s /opt/omi/lib/libmi.so /opt/microsoft/powershell/6.0.0-alpha.11/libmi.so'
  action :run
end
