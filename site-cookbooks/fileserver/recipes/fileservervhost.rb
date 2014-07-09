include_recipe "apache2"
include_recipe "apache2::mod_php5" 

app_name = "#{node[:fileserver][:name]}"
web_app app_name do
  server_name node[:fileserver][:server_name]
  docroot "#{node[:fileserver][:docroot]}/public"
  server_aliases node[:fileserver][:server_aliases]
  template "#{node[:fileserver][:name]}.conf.erb"
  log_dir node[:apache][:log_dir]  
end
