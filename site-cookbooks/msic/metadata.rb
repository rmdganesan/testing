name             'msic'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures msic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
maintainer        'Opscode, Inc.'
maintainer_email  'cookbooks@opscode.com'
license           'Apache 2.0'
description       'Installs and maintains php and php modules'
version           '1.4.6'

depends 'apache2'
depends "php"
depends "apt"
depends "openssl"
depends "mysql"

%w{ debian ubuntu centos redhat fedora scientific amazon windows oracle }.each do |os|
  supports os
end