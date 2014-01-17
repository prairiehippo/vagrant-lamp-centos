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