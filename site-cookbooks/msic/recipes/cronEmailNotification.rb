include_recipe "apache2"
include_recipe "php"
include_recipe "cron"



cron "EmailNotification" do
  hour "10"
  mailto "#{node[:msic][:adminemail]}"
  command "php #{node[:msic][:docroot]}/Script/emai-notification.php"
  action :create
end
