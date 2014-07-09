include_recipe "apache2"
include_recipe "apache2::mod_php5" 

app_name = "#{node[:mymsic][:name]}"
web_app app_name do
  server_name node[:mymsic][:server_name]
  docroot node[:mymsic][:docroot]
  server_aliases node[:mymsic][:server_aliases]
  template "#{node[:mymsic][:name]}.conf.erb"
  log_dir node[:apache][:log_dir]  
end