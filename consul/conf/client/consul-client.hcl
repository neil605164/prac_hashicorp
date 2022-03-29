datacenter = "ithome"
data_dir = "/home/hsieh/prac_hashicorp/consul/data"
disable_update_check = true

node_name = "consul-client-1"
client_addr = "0.0.0.0"
bind_addr = "10.0.2.34"

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

## 服務註冊
service {
    name = "ithome-web"
    tags = ["web","http"]
    port = 80
    token = "43fdf8a7-7f87-9f5d-3d95-5bc07dc1d5e0"

    ## health check
    checks = [
        {
            id = "nginx"
            name = "nginx service"
            http = "http://localhost"
            interval = "10s"
            timeout = "1s"
        },
        {
            id = "tcp"
            name = "check tcp 80 port"
            tcp = "localhost:80"
            interval = "6s"
            timeout = "3s"
        }
    ]   
}