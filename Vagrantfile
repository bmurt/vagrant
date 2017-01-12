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

  # Solr - Ubuntu 14.04 Box
  config.vm.define :solr do |box_config|
    box_config.vm.box = 'puppetlabs/ubuntu-14.04-64-puppet'
    box_config.vm.network :private_network, type: 'dhcp'
    box_config.vm.hostname = 'solr'
    box_config.vm.provision :shell, :path => 'solr-bootstrap.sh'
    box_config.vm.synced_folder '/Users/brendan/usp/puppet-solr-server-prebake/environments/production/hieradata', '/etc/puppet/hieradata'
    box_config.vm.provider :virtualbox do |vb|
      vb.name = "solr"
    end

    box_config.vm.provision :puppet do |puppet|
      puppet.environment_path = '/Users/brendan/usp/puppet-solr-server-prebake/environments'
      puppet.environment = 'production'
      puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'solr.pow.boomboom'
      }
    end
  end

  # eXist - Ubuntu 14.04 Box
  config.vm.define :exist do |box_config|
    box_config.vm.box = 'puppetlabs/ubuntu-14.04-64-puppet'
    box_config.vm.network :private_network, type: 'dhcp'
    box_config.vm.hostname = 'exist'
    box_config.vm.provision :shell, :path => 'exist-bootstrap.sh'
    box_config.vm.synced_folder '/Users/brendan/usp/puppet-exist-server-prebake/environments/production/hieradata', '/etc/puppet/hieradata'
    box_config.vm.provider :virtualbox do |vb|
      vb.name = "exist"
    end

    box_config.vm.provision :puppet do |puppet|
      puppet.environment_path = '/Users/brendan/usp/puppet-exist-server-prebake/environments'
      puppet.environment = 'production'
      puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'solr.pow.boomboom'
      }
    end
  end

  # Web - CentOS 6.6 Box
  config.vm.define :web do |box_config|
    box_config.vm.box = 'puppetlabs/centos-6.6-64-puppet'
    box_config.vm.network :private_network, type: 'dhcp'
    box_config.vm.hostname = 'web'
    box_config.vm.provision :shell, :path => 'web-bootstrap.sh'
    box_config.vm.synced_folder '/Users/brendan/usp/puppet-web-server-prebake/environments/production/hieradata', '/etc/puppet/hieradata'
    box_config.vm.provider :virtualbox do |vb|
      vb.name = "web"
    end

    box_config.vm.provision :puppet do |puppet|
      puppet.environment_path = '/Users/brendan/usp/puppet-web-server-prebake/environments'
      puppet.environment = 'production'
      puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'hiera.yaml'
      puppet.facter = {
        "fqdn" => 'web.pow.boomboom'
      }
    end
  end
end
