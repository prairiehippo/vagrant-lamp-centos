# sets up the requirements for running Drupal
include_recipe "drush"

package "php-xml" do
	action :install
end

# install custom php ini overrides file
template "#{node['php']['ext_conf_dir']}/php.ini" do
  source "php_custom.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

# update the main pecl channel
bash "pecl-update" do
  user "root"
  cwd "/tmp"
  code "pecl channel-update pecl.php.net"
end

php_pear "imagick" do
  action :install
  version '3.1.2'
end

# reboot apache to ensure changes are recognized
service 'apache2' do
  action :restart
end

#add custom aliases for the vagrant user
template "/home/vagrant/.bashrc" do
  source "bashrc.erb"
  mode 0540
  owner "vagrant"
  group "vagrant"
end

group "www-data" do
  action :create
  members "apache,vagrant"
  append false
end

group "admin" do
  action :modify
  members "vagrant"
  append false
end

#add custom sudoers file
template "/etc/sudoers" do
  source "sudoers.erb"
  mode 0440
  owner "root"
  group "root"
end
