# use a template to create a phpinfo page (just creating the file and passing in one variable)
template "#{node.app.docroot}/phpinfo.php" do
    source "testpage.php.erb"
    mode 0755
    variables ({
        :title => node.app.name
    })
end