#
# Cookbook Name:: htmldoc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


execute "htmldoc" do
  case node[:platform]
  when "centos","redhat","fedora","suse"
    command "sudo yum install htmldoc"
  when "debian","ubuntu"
    command "sudo apt-get install htmldoc"
  end
  action :run
end