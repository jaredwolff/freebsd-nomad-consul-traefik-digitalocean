# Increase log verbosity
log_level = "WARN"

# Setup data dir
data_dir = "/var/nomad/server/"
plugin_dir = "/var/nomad/plugins/"

# Plugin for jails
plugin "jail-task-driver" {}

# Log dir
# Note: not supported for 0.10.0
# TODO: upgrade
# log_file = "/var/log/"

# Enable the server
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}

# Enable the client
client {
    enabled = true

    # Set the server
    servers = ["127.0.0.1:4647"]
}