Vagrant.configure(2) do |config|
  config.vm.box = "bento/freebsd-12.1"
  config.vm.hostname = "nomad"

  # Put into bridge mode so we can run ansible
  config.vm.network "public_network", bridge: [
  "en0: Wi-Fi (AirPort)",
  ]

  # Expose the nomad api and ui to the host
  config.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true
  config.vm.network "forwarded_port", guest: 8500, host: 8500, auto_correct: true
  config.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true

  # Increase memory for Virtualbox
  config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
  end

  # Install python first!
  config.vm.provision "shell", inline: "sudo pkg install --yes python3"

  # Run the playbook
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbooks/main.yml"
  end

end