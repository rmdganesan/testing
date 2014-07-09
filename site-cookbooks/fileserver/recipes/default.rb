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


directory "#{node[:fileserver][:docroot]}" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end
git "#{node[:fileserver][:docroot]}" do
   repository "https://github.com/mganesan/fileserver.git"
   reference "master"
   action :sync
end


#upload folder 
execute 'upload_soft_link' do
  command "ln -s #{node[:msic][:docroot]}/public/uploads/ #{node[:fileserver][:docroot]}/public/uploads"
end
include_recipe "fileserver::configchange"
include_recipe "fileserver::fileservervhost"