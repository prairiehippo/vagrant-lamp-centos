#
# Cookbook Name:: chive
# Recipe:: default
#

bash "install_chive" do
  code <<-EOF
    wget -P /opt -O - http://www.chive-project.com/Download/Redirect | tar -xz -C /opt
  EOF
  not_if { File.directory?("/opt/chive") }
end