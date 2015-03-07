include_recipe "database::mysql"
include_recipe "apache2"

# function used to create the virtual host root and create the associated database
def setup_site(site)
    # create folder
    htdocs = node["www_root"] + "/#{site['hostname']}"
    directory htdocs do
      mode "0755"
      action :create
    end

    # create vhost config
    web_app site['hostname'] do
      server_name site['hostname']
      server_aliases [site['hostname']]
      port site['port']
      template "vhost.conf.erb"
      docroot htdocs
    end

    #create database
    mysql_database "#{site['database_name']}" do
      connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
      action :create
    end
end

# Check the chef configuration
if node["sites"]
  node["sites"].each do |index, site|
    setup_site(site)
  end
end

web_app '000-default' do
  docroot node["www_root"]
  template "default_vhost.conf.erb"
end
