Vagrant.configure("2") do |config|

  config.vm.box = "precise32"

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "init.pp"
  end

  config.vm.define :jboss do |jboss|
    jboss.vm.network :forwarded_port, guest: 80, host: 28081

    jboss.vm.provision :puppet do |puppet|
      puppet.manifest_file = "jboss.pp"
    end
  end

end
