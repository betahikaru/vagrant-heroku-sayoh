# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hfm4/centos7"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10", auto_config: false
  # config.ssh.forward_agent = true
  config.vm.synced_folder "./data", "/vagrant_data"

  config.vm.provision "shell", inline: <<-EOS
    sudo yum install wget git ruby
    ruby -v
    heroku version || wget -qO- https://toolbelt.heroku.com/install.sh | sh
    grep heroku ~/.bash_profile || echo 'PATH="/usr/local/heroku/bin:$PATH"' >> ~/.bash_profile; source ~/.bash_profile
    
  EOS
end

