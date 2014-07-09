# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
#project_name = "msic"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8085
  config.vm.synced_folder "./msic", "/var/www/msic/", :mount_options => ["dmode=777", "fmode=666"]
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "192.168.33.10"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    #config.vm.define project_name do |node|
    config.vm.hostname = "msic.local"
    config.vm.network :private_network, ip: "192.168.33.10"
    config.hostmanager.aliases = [ "www.msic.local",   "msic.local" ]
    #end
    config.vm.provision :hostmanager

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with CFEngine. CFEngine Community packages are
  # automatically installed. For example, configure the host as a
  # policy server and optionally a policy file to run:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.am_policy_hub = true
  #   # cf.run_file = "motd.cf"
  # end
  #
  # You can also configure and bootstrap a client to an existing
  # policy server:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.policy_server_address = "10.0.2.15"
  # end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
   config.vm.provision "chef_solo" do |chef|
     chef.cookbooks_path = ["cookbooks","site-cookbooks"]
     chef.roles_path = "./roles"
     chef.data_bags_path = "./data_bags"
     chef.add_recipe "apt"
     chef.add_recipe "apache2"
     chef.add_recipe "database"
     chef.add_recipe "mysql::server"
     chef.add_recipe "php"
     chef.add_recipe "php::module_apc"
     chef.add_recipe "php::module_curl"
     chef.add_recipe "php::module_mysql"
     chef.add_recipe "apache2::mod_php5"
     chef.add_recipe "apache2::mod_rewrite"
     chef.add_recipe "msic"
     chef.add_recipe "fileserver"
     chef.add_recipe "mymsic"     
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
     chef.json = { 
          :app => {
            # Project name
            :name => "msic",

            # Name of MySQL database that should be created
            :db_name => "msic_db",

            # Server name and alias(es) for Apache vhost
            :server_name => "msic.local",
            :server_aliases => [ "www.msic.local",  "msic.local" ],

            # Document root for Apache vhost
            :docroot => "/var/www/msic",
          },
         :mysql => {
            :server_root_password => 'ilikerandompasswords',
            :server_debian_password => nil,
            :server_repl_password => nil,
         },
	       :php => {
            :install_method => "source",
            :configure_options => [
                "--prefix=/usr",
                "--with-config-file-path=/etc",
                "--with-config-file-scan-dir=/etc/php5/conf.d",
                "-enable-mbstring",
                "-with-mysql=mysqlnd",
                "-with-mysqli=mysqlnd",
                "-with-pdo-mysql=mysqlnd",
                "--with-zlib",
                "--with-apxs2=/usr/bin/apxs2",
                "--with-curl=/usr/local/lib",
                "--with-pear",
                "--enable-ftp",
                "--with-openssl",
                "--with-gd",
                "--with-freetype-dir",
                "--with-jpeg-dir=",
                "--enable-gd-native-ttf",
                "--with-gettext",
                "--with-mcrypt",
                "--enable-pcntl",
                "--enable-soap",
                "--enable-sockets",
                "--with-xmlrpc",
                "--with-xsl",
                "--enable-zip",
                "--enable-mbstring",
                "--enable-mysqlnd",
            ],
            :conf_dir => "/etc",
            :ext_conf_dir => "/etc/php5/conf.d",
            :directives => {
                "date.timezone" => "Europe/Rome",
                "error_reporting" => "E_ALL",
                "display_errors" => "On"
            },
            :version => "5.5.6"
        },
        :msic => {
            :url => 'https://msic.com.au',
            :docroot => '/home/msic',
            :name => 'msic',
            :server_name => 'msic.local',
            :adminemail => 'mganesan@identiv.com',
            :server_aliases => [ "www.msic.local",  "msic.local", "msic.dev.local" ],
            :database => {
              :name => 'msic',
              :user => 'msicuser',
              :password => 'msicpassword'
            }
          },
        :fileserver => {
            :url => 'https://local.fileserver',
            :docroot => '/home/fileserver',
            :name => 'fileserver',
            :server_name => 'fileserver.local',
            :adminemail => 'mganesan@identiv.com',
            :server_aliases => [ "www.fileserver.local",  "fileserver.local", "fileserver.dev.local" ]
          },
        :mymsic => {
            :url => 'https://mymsic.com.au',
            :docroot => '/home/mymsic',
            :name => 'mymsic',
            :server_name => 'mymsic.local',
            :adminemail => 'mganesan@identiv.com',
            :server_aliases => [ "www.mymsic.local",  "mymsic.local", "mymsic.dev.local" ],
            :database => {
              :name => 'mymsic',
              :user => 'mymsicuser',
              :password => 'mymsicpassword'
            }
          }
     }
   end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
