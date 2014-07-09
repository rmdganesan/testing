include_recipe "database::mysql"
 
mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
   :password => node['mysql']['server_root_password']
}
 
 mysql_database node['msic']['database']['name'] do
   connection mysql_connection_info
   action :create
 end
 
 mysql_database_user node['msic']['database']['user'] do
   connection mysql_connection_info
   password node['msic']['database']['password']
   database_name node['msic']['database']['name']
   host '%'
   action :grant
 end

# import an sql dump from your app_root/data/dump.sql to the my_database database
execute "import" do
  command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" \"#{node['msic']['database']['name']}\" < #{node[:msic][:docroot]}/sql/dbdump.sql"
  action :run
end