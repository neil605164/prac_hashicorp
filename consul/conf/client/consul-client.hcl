datacenter = "ithome"
data_dir = "/home/hsieh/prac_hashicorp/consul/data"
disable_update_check = true

node_name = "consul-client-1"
client_addr = "0.0.0.0"
bind_addr = "10.0.2.33"

connect {
  enabled = true
}

retry_join  = ["10.0.2.16"]
retry_interval = "20s"

log_level = "DEBUG"
log_file = "/home/hsieh/prac_hashicorp/consul/logs/"
log_rotate_duration = "24h"
log_rotate_max_files = 0

performance {
  raft_multiplier = 1
}

## 新增 client token
acl {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
  tokens {
    agent = "43fdf8a7-7f87-9f5d-3d95-5bc07dc1d5e0"
  }
}