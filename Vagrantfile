Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu64'
  #config.vm.box_url = 'http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box'
  config.vm.synced_folder '/Users/bmurtagh/Dropbox/PHRG/puppet/hieradata', '/etc/puppetlabs/puppet/hieradata'
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus",   "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define :ubuntu_vm do |ubuntu_vm|
    ubuntu_vm.vm.network :private_network, ip: "10.10.10.10" 
    ubuntu_vm.vm.hostname = "ubuntu64"
    ubuntu_vm.vm.provider :virtualbox do |vb|
      vb.name = "Ubuntu64"
  end

    ubuntu_vm.vm.provision :puppet do |puppet|
      puppet.manifests_path = '/Users/bmurtagh/Dropbox/PHRG/puppet/environments/vagrant/manifests'
      puppet.manifest_file = 'site.pp'
      puppet.options = "--config /vagrant/puppet.conf --fileserverconfig=/vagrant/fileserver.conf --environment vagrant"
      puppet.module_path = ['/Users/bmurtagh/Dropbox/PHRG/puppet/environments/vagrant', '/Users/bmurtagh/Dropbox/PHRG/puppet/modules']
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = { 
        "fqdn" => 'ubuntu64.powerhrg.com'
      }
    end
  end
end
