# Increase log verbosity
log_level = "WARN"

# Setup data dir
data_dir = "/var/nomad/client/"
plugin_dir = "/var/nomad/plugins/"

# Plugin for jails
plugin "jail-task-driver" {}

# Log dir
# log_file= "/var/log/"

# Enable the client
client {
    enabled = true

    # Set the server
    servers = ["nomad.global:4647"]
}

# Modify our port to avoid a collision with server1
ports {
    http = 5656
}