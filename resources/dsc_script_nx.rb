property :name, String, name_property: true
property :code, String

provides :dsc_script_nx

action :run do
  configuration_name = "dsc-#{Time.now.utc.strftime '%Y%m%dT%H%M%S%L'}"

  execute 'download Core PowerShell nx module' do
    command 'powershell -command "Save-Module -Name nx -Path /opt/microsoft/powershell/6.0.0-alpha.11/Modules"'
    action :run
    not_if { ::File.directory?('/opt/microsoft/powershell/6.0.0-alpha.11/Modules/nx') }
  end

  file "/tmp/#{configuration_name}.ps1" do
    content configuration(configuration_name, new_resource.code)
    action :create
  end

  execute "Generate MOF from #{configuration_name}" do
    command "powershell /tmp/#{configuration_name}.ps1"
    action :run
  end

  execute 'Apply configuration MOF' do
    command "sudo /opt/microsoft/dsc/Scripts/StartDscConfiguration.py -configurationmof /tmp/#{configuration_name}/localhost.mof"
    action :run
  end
end

def configuration(configuration_name, configuration_code)
  <<-EOH
Configuration #{configuration_name} {

    node localhost {
#{configuration_code}
    }
}

#{configuration_name} -OutputPath /tmp/#{configuration_name}
  EOH
end
