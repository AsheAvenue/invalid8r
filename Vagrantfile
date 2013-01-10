Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.customize do |vm|
    vm.memory_size = 256
  end
  config.vm.share_folder("v-root", "/var/www", ".", :nfs => true)
  config.vm.network :hostonly, "33.33.33.33"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "vim"
    chef.add_recipe "rubygems"
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "git"
    chef.add_recipe "varnish"
  end
end
