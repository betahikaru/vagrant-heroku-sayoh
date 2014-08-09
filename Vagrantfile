# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

SYNC_FOLDER = "/vagrant_data"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hfm4/centos7"
  config.vm.network :forwarded_port, guest: 9292, host: 9292
  config.vm.network :private_network, ip: "192.168.33.10", auto_config: false
  config.ssh.forward_agent = true
  config.vm.synced_folder "./data", SYNC_FOLDER

  config.vm.provision "shell", inline: <<-EOS
    # install basic-tool
    sudo yum install -y git wget

    # setting git
    cat <<EOF >>/home/vagrant/.ssh/config
      Host github.com
        StrictHostKeyChecking no
      EOF

    # install ruby
    sudo yum install -y git ruby
    ruby -v
    gem install bundler -q
    bundle -v

    # install dev-tool for gem(http_parser)
    sudo yum install -y gcc
    sudo yum --enablerepo=remi,remi-test -y install ruby-devel

  EOS
end

