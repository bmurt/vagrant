
# Ubuntu 14.04 x64
Vagrant.configure("2") do |config|
  config.vm.box = 'puppetlabs/ubuntu-14.04-64-puppet'
  config.vm.synced_folder '/Users/brendan/Dropbox/Development/dmoore-puppet/hieradata', '/etc/puppet/hieradata'
  config.vm.provision :shell, :path => "ubuntu_bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus",   "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define :ubuntu_vm do |ubuntu_vm|
    ubuntu_vm.vm.network :public_network, ip: "10.1.1.221"
    ubuntu_vm.vm.hostname = "ubuntu"
    ubuntu_vm.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu"
  end

    ubuntu_vm.vm.provision :puppet do |puppet|
      puppet.manifests_path = '/Users/brendan/Dropbox/Development/dmoore-puppet/manifests'
      puppet.manifest_file = 'site.pp'
      puppet.options = "--config /vagrant/puppet.conf --fileserverconfig=/vagrant/fileserver.conf --environment production"
      puppet.module_path = ['/Users/brendan/Dropbox/Development/dmoore-puppet/modules']
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'ubuntu.pow.boomboom'
      }
    end
  end
end

# CentOS 6.6 x64
# Vagrant.configure("2") do |centos_config|
#  centos_config.vm.box = 'puppetlabs/centos-6.6-64-puppet'
#  centos_config.vm.synced_folder '/Users/brendan/Dropbox/Development/dmoore-puppet/hieradata', '/etc/puppet/hieradata'
#  centos_config.vm.provision :shell, :path => "centos_bootstrap.sh"

#  centos_config.vm.provider :virtualbox do |centos_vb|
#    centos_vb.customize ["modifyvm", :id, "--memory", "2048"]
#    centos_vb.customize ["modifyvm", :id, "--ioapic", "on"]
#    centos_vb.customize ["modifyvm", :id, "--cpus",   "2"]
#    centos_vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#    centos_vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
#  end

#  centos_config.vm.define :centos_vm do |centos_vm|
#    centos_vm.vm.network :public_network, ip: "10.1.1.222"
#    centos_vm.vm.hostname = "centos"
#    centos_vm.vm.provider :virtualbox do |vb|
#      vb.name = "centos"
#  end

#    centos_vm.vm.provision :puppet do |puppet|
#     puppet.manifests_path = '/Users/brendan/Dropbox/Development/dmoore-puppet/manifests'
#     puppet.manifest_file = 'site.pp'
#     puppet.options = "--config /vagrant/puppet.conf --fileserverconfig=/vagrant/fileserver.conf --environment production"
#     puppet.module_path = ['/Users/brendan/Dropbox/Development/dmoore-puppet/modules']
#     puppet.hiera_config_path = 'hiera.yaml'
#     puppet.facter = {
#       "fqdn" => 'centos.pow.boomboom'
#     }
#    end
#  end
# end
