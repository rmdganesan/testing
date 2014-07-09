include_recipe "apache2"
include_recipe "apache2::mod_php5" 

app_name = "#{node[:msic][:name]}"
web_app app_name do
  server_name node[:msic][:server_name]
  docroot "#{node[:msic][:docroot]}/public"
  server_aliases node[:msic][:server_aliases]
  template "#{node[:msic][:name]}.conf.erb"
  log_dir node[:apache][:log_dir]  
end
