# Basic Vagrantfile configuration for Ubuntu 14.04 and CentOS 6.6 with Puppet

Vagrant.configure("2") do |config|

  # Shared VM settings
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus",   "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Ubuntu 14.04 Box
  config.vm.define :ubuntu do |box_config|
    box_config.vm.box = 'puppetlabs/ubuntu-14.04-64-puppet'
    box_config.vm.network :private_network, type: 'dhcp'
    box_config.vm.hostname = 'ubuntu'
    box_config.vm.provision :shell, :path => 'ubuntu-bootstrap.sh'
    box_config.vm.synced_folder '/Users/brendan/usp/puppet/hieradata', '/etc/puppet/hieradata'
    box_config.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu"
    end

    box_config.vm.provision :puppet do |puppet|
      puppet.environment_path = '/Users/brendan/usp/puppet/environments'
      puppet.environment = 'production'
      puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'ubuntu.pow.boomboom'
      }
    end
  end

  # CentOS 6.6 Box
  config.vm.define :centos do |box_config|
    box_config.vm.box = 'puppetlabs/centos-6.6-64-puppet'
    box_config.vm.network :private_network, type: 'dhcp'
    box_config.vm.hostname = 'centos'
    box_config.vm.provision :shell, :path => 'centos-bootstrap.sh'
    box_config.vm.synced_folder '/Users/brendan/usp/puppet/hieradata', '/etc/puppet/hieradata'
    box_config.vm.provider :virtualbox do |vb|
      vb.name = "centos"
    end

    box_config.vm.provision :puppet do |puppet|
      puppet.environment_path = '/Users/brendan/usp/puppet/environments'
      puppet.environment = 'production'
      puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'centos.pow.boomboom'
      }
    end
  end
end
