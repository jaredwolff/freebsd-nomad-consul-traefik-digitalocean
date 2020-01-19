# Server Architecture Setup

This server configuration requires `terraform`. [Download it here](https://www.terraform.io/downloads.html) and put it in your path.

## Install deps

```
make init
```

## View `plan`

```
make plan
```

### Apply `plan`

```
make deploy
```

## Resources

- https://learn.hashicorp.com/nomad/getting-started/jobs



## Tutorial

Creating a server infrasctucture as code. First want to define the droplets we want to create.


Then, we want to install the dependencies for `Ansible` so we can run playbooks to configure the rest of the server.

```
provisioner "remote-exec" {
  inline = ["sudo apt-get -qq install python -y"]
}
```

Testing this stuff can get complicated fast. To speed things up, a simple `Vagrantfile` can be useful to test the `Ansible` scripts.

```
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04" # 18.04 LTS
  config.vm.hostname = "nomad"

  # Put into bridge mode so we can run ansible
  config.vm.network "public_network", bridge: [
  "en0: Wi-Fi (AirPort)",
  ]

  # Expose the nomad api and ui to the host
  config.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true

  # Increase memory for Virtualbox
  config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
  end

end
```

Once set up you can copy the address shown below:

```
    default: /vagrant => /Users/jaredwolff/Circuit_Dojo/freebsd-server
jaredwolff:freebsd-server jaredwolff$ vagrant ssh
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-72-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Jan 18 03:19:09 UTC 2020

  System load:  0.71              Processes:           94
  Usage of /:   2.5% of 61.80GB   Users logged in:     0
  Memory usage: 11%               IP address for eth0: 10.0.2.15
  Swap usage:   0%                IP address for eth1: 192.168.7.133

 * Overheard at KubeCon: "microk8s.status just blew my mind".

     https://microk8s.io/docs/commands#microk8s.status

0 packages can be updated.
0 updates are security updates.
```

In this case it's `192.168.7.133`

Running an `Ansible` playbook is as simple as running

```
ansible-playbook <hostname> path/to/playbook.yml
```