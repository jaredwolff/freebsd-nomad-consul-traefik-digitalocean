job "traefik" {
  datacenters = ["dc1"]
  type        = "service"

  group "traefik" {
    restart {
      attempts = 0
      mode     = "fail"
    }

    task "test01" {
      driver = "jail-task-driver"

      config {
        Path              = "/zroot/iocage/jails/traefik/root"
        Ip4               = "inherit"
        Allow_raw_sockets = true
        Allow_chflags     = true
        Exec_start        = "/usr/local/bin/traefik --api=true --api.insecure=true"
        Persist  = true
      }
    }
  }
}