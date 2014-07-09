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


directory "#{node[:msic][:docroot]}" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end
git "#{node[:msic][:docroot]}" do
   repository "https://github.com/mganesan/msic.git"
   reference "master"
   action :sync
end
#include_recipe "msic::dbupdate"
include_recipe "msic::configchange"
include_recipe "msic::msicvhost"
include_recipe "msic::htmldoc"
include_recipe "msic::cronEmailNotification"
include_recipe "msic::cron2ndverification"
