# -- Setup the website
# create the webroot
directory "#{node.app.docroot}" do
    mode 0755
end

# copy in an index.html from mysite/files/default/index.html
 cookbook_file "#{node.app.docroot}/index.html" do
    source "index.html"
    mode 0755
 end


 # use a template to create a phpinfo page (just creating the file and passing in one variable)
template "#{node.app.docroot}/phpinfo.php" do
    source "testpage.php.erb"
    mode 0755
    variables ({
        :title => node.app.name
    })
end