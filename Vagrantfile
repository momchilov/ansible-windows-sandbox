# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ansible-master" do |am|
    am.vm.box = "ubuntu/trusty64"
    am.vm.box_check_update = false
    am.vm.network :private_network, ip: "192.168.33.10", :adapter => 2
    am.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      # Customize the amount of memory on the VM:
      vb.memory = "1024"
    end
    am.vm.provision "file", source: "./playbook.yml", destination: "/tmp/playbook.yml"
    am.vm.provision "file", source: "./neovim-config.vim", destination: "/tmp/nvim-init.vim"
    am.vm.provision "shell", inline: <<-SHELL
      echo "ansible-master" > /etc/hostname
      hostname "ansible-master"
      mkdir -p /etc/xdg/nvim/
      cp -v /tmp/nvim-init.vim /etc/xdg/nvim/init.vim
      apt install -y software-properties-common
      apt-add-repository ppa:ansible/ansible
      apt-add-repository ppa:neovim-ppa/unstable
      apt update
      apt install -y ansible neovim tmux git
      ansible-playbook --inventory="localhost," -c local  /tmp/playbook.yml || exit 0
      SHELL
  end 
  config.vm.define "windows" do |win|
    win.vm.guest = :windows
    win.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
    win.vm.box_check_update = false
    win.vm.network :private_network, ip: "192.168.33.11", :adapter => 2
    win.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      # Customize the amount of memory on the VM:
      vb.memory = "1024"
    end
    win.vm.provision "shell", inline: <<-SHELL
      cscript.exe "c:\\windows\\System32\\slmgr.vbs" /ato
      SHELL
  end 
  
end
