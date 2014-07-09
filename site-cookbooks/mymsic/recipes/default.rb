#
# Cookbook Name:: demo1
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "git"


directory "#{node[:mymsic][:docroot]}" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end



git "#{node[:mymsic][:docroot]}" do
   repository "https://github.com/mganesan/mymsic.git"
   reference "master"
   action :sync
end

directory "#{node[:mymsic][:docroot]}/logs" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

directory "#{node[:mymsic][:docroot]}/tmp" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
 action :create
end

#upload folder 
execute 'upload_soft_link' do
  command "ln -s #{node[:msic][:docroot]}/public/uploads/ #{node[:mymsic][:docroot]}/uploads"
end

#include_recipe "mymsic::dbupdate"
include_recipe "mymsic::configchange"
include_recipe "mymsic::mymsicvhost"