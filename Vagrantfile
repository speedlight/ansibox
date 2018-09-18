# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  config.ssh.port = 2222

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Ansible Sandbox #{Time.now.to_i}"
    vb.cpus = 2
    vb.memory = "1024"
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :public_network
  config.vm.network :private_network, ip: "172.16.2.10"
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
  config.ssh.private_key_path = [ "~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key" ]

  #config.vm.provision "ansible" do |ansible|
  #  ansible.verbose = "vv"
  #  ansible.playbook = "roles/postinstall/main.yml"
  #end
end
