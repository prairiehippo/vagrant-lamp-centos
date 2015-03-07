#
# Cookbook Name:: mailcatcher
# Recipe:: default
#

package "sqlite-devel" do
  action :install
end

gem_package "mailcatcher" do
  action :install
end

# The --http-ip param enables us to use localhost and port forwarding from the host
execute "mailcatcher" do
  command "mailcatcher --http-ip '0.0.0.0'"
  not_if "ps -Al | grep mailcatcher"
end

bash "mailcatcher_on_start" do
  user "root"
    cwd "/tmp"
    code <<-EOT
       echo "mailcatcher --http-ip '0.0.0.0'" >> /etc/rc.local
    EOT
    not_if "cat /etc/rc.local | grep mailcatcher"
end


ruby_block "add_sendmail_path" do
  block do
    php_ini_locations = ['/etc/php.ini']
    php_ini_locations.each do |php_ini|
      file = Chef::Util::FileEdit.new(php_ini)
      file.search_file_replace(/^;sendmail_path =/, 'sendmail_path = "/usr/bin/env catchmail"')
      file.write_file
    end
  end
end

service "apache2" do
  action :restart
end