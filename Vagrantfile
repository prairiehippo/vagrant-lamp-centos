VAGRANTFILE_API_VERSION = "2"

www_root = '/www'
server_ip = "33.33.33.20"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.hostname = "centos65.localhost"

  # setup networking
  # Use private networking to take advantage of NFS for sharing folder.  This is dramatically faster then
  # using standard virtual box file sharing.
  config.vm.network :private_network, ip: server_ip
  config.ssh.forward_agent = true
  config.vm.network "forwarded_port", guest: 80, host: 8000

  # sync the folder
  config.vm.synced_folder "./webroot", www_root, :nfs => true

  config.vm.provision :chef_solo do |chef|

    # setup chef information paths
    chef.cookbooks_path = ["chef/cookbooks/lib-cookbooks", "chef/cookbooks"]
    chef.roles_path = "chef/roles"

    # install roles
    chef.add_role('basic_lamp')

    # set up some configuration variables for chef
    chef.json.merge!({
      :www_root => www_root,
      :server_ip => server_ip,

      :mysql => {
        :server_root_password => 'root',
        :server_repl_password => 'root',
        :server_debian_password => 'root',
        :tunable => {
          :max_allowed_packet => '128M',
          :query_cache_size => '64M',
          :thread_cache_size => 32,
          :table_cache => 128,
          :innodb_buffer_pool_size => '12G',
          :innodb_additional_mem_pool_size => '8M',
          :innodb_log_file_size => '256M'
        }
      },

      :composer => {
        :global_bin_dir => '/etc/composer',
        :owner => 'root',
        :group => 'admin'
      },

      :php => {
        :memory_limit => '256M'
      },

      :nodejs => {
        :install_method => 'package'
      },

      #default site setup
      :sites => {
        :local => {
          :hostname => "local.dev",
          :database_name => "local.dev",
          :port => 80
        }
      }

    })

  end

end
