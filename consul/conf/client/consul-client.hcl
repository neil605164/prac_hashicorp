datacenter = "ithome"
data_dir = "/Users/neil/prac_hashicorp/consul/data"
disable_update_check = true

node_name = "consul-client-1"
client_addr = "0.0.0.0"
bind_addr = "192.168.100.3"

connect {
  enabled = true
}

retry_join  = ["192.168.100.3"]
retry_interval = "20s"

log_level = "DEBUG"
log_file = "/Users/neil/prac_hashicorp/consul/logs/"
log_rotate_duration = "24h"
log_rotate_max_files = 0

performance {
  raft_multiplier = 1
}