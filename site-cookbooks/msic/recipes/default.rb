#
# Cookbook Name:: msic
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "msic::webfiles"
#include_recipe "msic::vhost"
# call "web_app" from the apache recipe definition to set up a new website
#web_app "msic" do
    # where the website will live
#   docroot "#{node.app.docroot}"

   # apache virtualhost definition
#   template "msic.conf.erb"
#end

app_name = "#{node['app']['name']}"

# Enable vhost
web_app app_name do
  server_name node['app']['server_name']
  server_aliases node['app']['server_aliases']
  docroot node['app']['docroot']
  log_dir node['apache']['log_dir']
  template node['app']['name']+".conf.erb"
end

# Disable default vhost config
apache_site "000-default" do
  enable true
end
