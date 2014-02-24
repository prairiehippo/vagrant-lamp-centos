#
# Cookbook Name:: tailon
# Recipe:: default
#

python_pip "tailon" do
  action :install
end

bash "tailon_on_start" do
  user "root"
    cwd "/tmp"
    code <<-EOT
       echo "touch /tmp/berr.log && touch /tmp/BenevityClient.txt && chmod 666 /tmp/berr.log && chmod 666 /tmp/BenevityClient.txt && nohup tailon --bind 33.33.33.20:8080 --allow-transfers -f /tmp/BenevityClient.txt /var/log/httpd/*{access,error}.log /tmp/berr.log /var/log/messages &" >> /etc/rc.local
    EOT
    not_if "cat /etc/rc.local | grep tailon"
end

execute "tailon" do
  command "touch /tmp/berr.log && touch /tmp/BenevityClient.txt && chmod 666 /tmp/berr.log && chmod 666 /tmp/BenevityClient.txt && nohup tailon --bind 33.33.33.20:8080 --allow-transfers -f /tmp/BenevityClient.txt /var/log/httpd/*{access,error}.log /tmp/berr.log /var/log/messages &"
  not_if "ps -Al | grep tailon"
end