vagrant-lamp-centos
===================

CentOS compliant Vagrant profile for LAMP development

Instructions
============
- Download and install Vagrant
- Download and install VirtualBox
- Install nfsd if using Linux (NFS comes preinstalled with OS X. Ubuntu: sudo apt-get install nfs-kernel-server)
- Clone this repository into a directory on your local machine
- Change directory into the new folder created by the clone command (vagrant profile folder)
- Make a directory called "webroot" (mkdir webroot).  This is the synched folder between your VM and the Host
- In "chef/databags/config", copy the "config.json.sample" to a new file "config.json".  Edit this file, changing the parameters for your name and IP address.
- Edit your /etc/hosts file to associate 33.33.33.20 to host names. For all of the Benevity frontend properties, add: "33.33.33.20 vm wpg.trunk wpg.eel causes.trunk causes.eel secure.trunk secure.eel receipts.trunk receipts.eel atb trunk.atb.eel" (see Sample Hosts File below)
- Run "vagrant up" from the base of the vagrant profile folder
- On your host machine, in the "webroot" directory you created under the vagrant profile folder, run ./checkout_projects.sh. This will download all of the project code from subversion.
- SSH into your VM by running: vagrant ssh
- cd /www. This is the directory that is synced to your "webroot" directory
- run ./install_helper.sh to install sites.

Sample Hosts File
=================
33.33.33.20 vm
33.33.33.20 wpg.trunk
33.33.33.20 causes.trunk
33.33.33.20 secure.trunk
33.33.33.20 atb.trunk
33.33.33.20 receipts.trunk

33.33.33.20 wpg.eel
33.33.33.20 causes.eel
33.33.33.20 secure.eel
33.33.33.20 atb.eel
33.33.33.20 receipts.eel