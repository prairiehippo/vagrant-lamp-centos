VAGRANTFILE_API_VERSION = "2"

www_root = '/www'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS65-x64"
  config.vm.box_url = "http://192.168.2.81/vagrant_boxes/CentOS65-x64.box"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 2048]
  end

  # setup networking
  # Use private networking to take advantage of NFS for sharing folder.  This is dramatically faster then
  # using standard virtual box file sharing.
  config.vm.network :private_network, ip: "33.33.33.20"
  config.ssh.forward_agent = true
  config.vm.network "forwarded_port", guest: 80, host: 8000

  # sync the folder
  config.vm.synced_folder "./webroot", www_root, :nfs => true

  config.vm.provision :chef_solo do |chef|

    # setup chef information paths
    chef.cookbooks_path = ["chef/cookbooks/lib-cookbooks", "chef/cookbooks"]
    chef.data_bags_path = ["chef/databags"]
    chef.roles_path = "chef/roles"

    # install roles
    chef.add_role('basic_lamp')

    # set up some configuration variables for chef
    chef.json.merge!({
      :www_root => www_root,

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
        :install_globally => true,
      },

      :drush => {
        :install_method => 'pear',
        :version => '6.0.0'
      },

      :php => {
        :memory_limit => '256M'
      },


      :nodejs => {
        :install_method => 'package'
      },

      #default site setup
      :sites => {
        :wpg_trunk => {
          :hostname => "wpg.trunk",
          :database_name => "wpg.trunk",
          :port => 80
        },
        :wpg_eel => {
          :hostname => "wpg.eel",
          :database_name => "wpg.eel",
          :port => 80
        },
        :causes_trunk => {
          :hostname => "causes.trunk",
          :database_name => "causes.trunk",
          :port => 80
        },
        :causes_eel => {
          :hostname => "causes.eel",
          :database_name => "causes.eel",
          :port => 80
        },
        :secure_trunk => {
          :hostname => "secure.trunk",
          :database_name => "secure.trunk",
          :port => 80
        },
        :secure_eel => {
          :hostname => "secure.eel",
          :database_name => "secure.eel",
          :port => 80
        },
        :atb_trunk => {
          :hostname => "atb.trunk",
          :database_name => "atb.trunk",
          :port => 80
        },
        :atb_eel => {
          :hostname => "atb.eel",
          :database_name => "atb.eel",
          :port => 80
        },
        :receipts_trunk => {
          :hostname => "receipts.trunk",
          :database_name => "receipts.trunk",
          :port => 80
        },
        :receipts_eel => {
          :hostname => "receipts.eel",
          :database_name => "receipts.eel",
          :port => 80
        }
      }

    })

  end

end
