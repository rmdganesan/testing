template "#{node[:fileserver][:docroot]}/config/config.ini" do
    source "config.ini.erb"
    mode 0755
end