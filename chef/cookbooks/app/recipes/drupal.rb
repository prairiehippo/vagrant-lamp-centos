# sets up the requirements for running Drupal

# install custom php ini overrides file
template "#{node['php']['ext_conf_dir']}/php.ini" do
  variables( :host_ip => node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first )
  source "php_custom.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

group "www-data" do
  action :create
  members "apache,vagrant"
  append false
end

directory "/etc/composer" do
  owner "root"
  group "root"
  mode 00775
  action :create
end

# package "php-xml" do
# 	action :install
# end

# # install the xdebug pecl
# php_pear "xdebug" do
#   # Specify that xdebug.so must be loaded as a zend extension
#   zend_extensions ['xdebug.so']
#   action :install
# end

# # update the main pecl channel
# bash "pecl-update" do
#   user "root"
#   cwd "/tmp"
#   code "pecl channel-update pecl.php.net"
# end

# php_pear "imagick" do
#   action :install
#   version '3.1.2'
# end

# # install apc pecl with directives
# package "pcre-devel" do
#   action :install
# end

# php_pear "apc" do
#   action :install
#   directives(:shm_size => '128M', :enable_cli => 1)
# end

# # reboot apache to ensure changes are recognized
# service 'apache2' do
#   action :restart
# end

# #add custom aliases for the vagrant user
# template "/home/vagrant/.bashrc" do
#   source "bashrc.erb"
#   mode 0540
#   owner "vagrant"
#   group "vagrant"
# end

# directory "/opt/drush" do
#   owner "vagrant"
#   group "admin"
#   mode 00775
#   action :create
# end

# git '/opt/drush' do
#   repository "https://github.com/drush-ops/drush.git"
#   reference '6.2.0'
#   user 'vagrant'
#   group 'admin'
#   action :sync
# end

# link "/usr/bin/drush" do
#   to "/opt/drush/drush"
# end
