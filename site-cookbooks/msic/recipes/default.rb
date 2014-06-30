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

# call "web_app" from the apache recipe definition to set up a new website
web_app "msic" do
    # where the website will live
   docroot "#{node.app.docroot}"

   # apache virtualhost definition
   template "msic.conf.erb"
end

include_recipe "msic::webfiles"