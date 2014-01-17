vagrant-lamp-centos
===================

CentOS compliant Vagrant profile for LAMP development

Instructions
============
- Download and install Vagrant
- Download and install VirtualBox
- Install nfsd if using Linux (NFS comes preinstalled with OS X)
- Clone this repository into a directory on your local machine
- Change directory into the new folder created by the clone command (vagrant profile folder)
- Make a directory called "sites" (mkdir sites).  This is the synched folder between your VM and the Host
- In "chef/databags/sites", copy the "example.json.sample" to a new file (e.g. my_site.json).  Edit this file with the details of the site you want to host (e.g. "hostname": "mysite.localhost")
- Edit your /etc/hosts file to associate 33.33.33.20 to your host (e.g. 33.33.33.20 mysite.localhost)
- Run "vagrant up" from the base of the vagrant profile folder