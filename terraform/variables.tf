variable "do_token" {
  type = string
  description = "Digital Ocean token."
}

variable "pub_key" {
  type = string
  description = "Public key for this machine."
  default = "/Users/jaredwolff/.ssh/id_rsa.pub"
}

variable "pvt_key" {
  type = string
  description = "Private key for this machine."
  default = "/Users/jaredwolff/.ssh/id_rsa"
}

variable "ssh_fingerprint" {
  type = string
  description = "SSH fingerprint for the key above"
}

variable "nomad" {
  type = map(string)
  description = "Map for different configuration variables like address, etc."
}
