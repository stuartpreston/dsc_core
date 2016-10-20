#
# Cookbook Name:: dsc_core
# Recipe:: demo_dsc_windows
#
# Copyright (c) 2016 Stuart Preston, All Rights Reserved.

dsc_script 'Hello, World!' do
  code <<-EOH
      File ExampleFile {
          DestinationPath = "c:\\example.txt"
          Contents = "Hello, PowerShell Conference Asia 2016!! `n"
          Ensure = "Present"
          Type = "File"
      }
  EOH
  action :run
end
