# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "public_network", :bridge => 'en0: Ethernet 1'

  config.ssh.forward_agent = true

  # Bootstrap installs puppet 3 from the puppetlabs repo,and some modules
  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "bootstrap.pp"
  end

  # Actually install the dev environment (default.pp)
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end
end
