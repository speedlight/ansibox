# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

 # config.ssh.port = 6622

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Ansible Sandbox #{Time.now.to_i}"
    vb.cpus = 1
    vb.memory = "512"
  end

  config.vm.network :public_network
  config.vm.network :private_network, ip: "10.10.2.3"
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.vm.provision "file", source: "~/.ssh/vagrantkey.pub", destination: "~/.ssh/authorized_keys"
  config.ssh.private_key_path = [ "~/.ssh/vagrantkey", "~/.vagrant.d/insecure_private_key" ]

  config.vm.provision "ansible" do |ansible|
    #ansible.verbose = "vv"
    ansible.playbook = "speedbox.yml"
  end
end
