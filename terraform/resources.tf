resource "digitalocean_droplet" "server" {
    image = "freebsd-12-1-x64-zfs"
    name = "test"
    region = "nyc1"
    size = "512mb"
    backups = false
    private_networking = true
    monitoring = true
    ssh_keys = [
      var.ssh_fingerprint
    ]
    connection {
      user = "root"
      type = "ssh"
      private_key = file(var.pvt_key)
      timeout = "2m"
      host = self.ipv4_address
    }

    # Run the playbook to setup the server
    provisioner "local-exec" {
      command = <<EOT
        sleep 30;
        echo "Installing Server config"
        ansible-playbook --private_key ${var.pvt_key} ../playbooks/main.yml;
        EOT
    }
}