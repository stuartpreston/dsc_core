#
# Cookbook Name:: dsc_core
# Recipe:: demo_dsc_nx
#
# Copyright (c) 2016 Stuart Preston, All Rights Reserved.

dsc_script_nx 'Hello, World!' do
  code <<-EOH
      nxFile ExampleFile {
          DestinationPath = "/tmp/example"
          Contents = "Hello, PowerShell Conference Asia 2016!! `n"
          Ensure = "Present"
          Type = "File"
      }
  EOH
  action :run
end
