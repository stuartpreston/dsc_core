#
# Cookbook Name:: dsc_core
# Recipe:: default
#
# Copyright (c) 2016 Stuart Preston, All Rights Reserved.

case node.platform
when 'ubuntu', 'debian'
  include_recipe '::install_deb'
  include_recipe '::demo_dsc_nx'

when 'centos', 'redhat', 'oracle', 'suse'
  include_recipe '::install_rpm'
  include_recipe '::demo_dsc_nx'

when 'windows'
  include_recipe '::install_nano' unless node.name.index('nano').nil?
  include_recipe '::demo_dsc_windows'
end
