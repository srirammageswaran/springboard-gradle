# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'springboard-gradle-berkshelf'
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.install_url = 'http://cloudcto.wipro.com/dockerchef/install.sh'
    config.omnibus.chef_version = 'latest'
  end
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.201.23.229:3128/"
    config.proxy.https    = "http://10.201.23.229:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end
  config.vm.box = 'centos'
  config.vm.network :public_network, :use_dhcp_assigned_default_route => true, bridge: 'eth1'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|

    chef.json = {
      java: {
        jdk_version: 7,
        jdk: {
	  7 => {
	    x86_64: {
	      url: "http://cloudcto.wipro.com/dockerchef/jdk-7u25-linux-x64.tar.gz",
	      checksum: "83ba05e260813f7a9140b76e3d37ea33"
            } 
	  }
	},
        install_flavor: "oracle",
      }
    }
    chef.run_list = [
      'recipe[springboard-gradle::tarball]'
    ]
  end
end
