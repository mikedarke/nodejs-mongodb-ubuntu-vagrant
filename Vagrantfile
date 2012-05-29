Vagrant::Config.run do |config|

  config.vm.box = "lucid32"
  config.vm.network :hostonly, "33.33.33.101"
  # remove the next line when running on a windows host system (Windows does not have NFS support)
  #config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "app.pp"
	puppet.module_path = "modules"
  end
  
end