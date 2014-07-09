template "#{node[:mymsic][:docroot]}/configuration.php" do
    source "configuration.php.erb"
    mode 0755
end