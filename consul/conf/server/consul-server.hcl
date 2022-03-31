## 跟 consul 說這是 server 的角色, false 表示為 agent
server = true
## 預計要啟動幾個server,若為三台Consul server做HA, 則設定為3.
bootstrap_expect = 1
## 啟web UI的功能
ui = true
## 設定datacenter的名稱，沒設定的話預設是”dc1”
datacenter = "ithome"
## 用來儲存Consul放資料的地方
data_dir = "/home/hsieh/prac_hashicorp/consul/data"
## 更新檢查
disable_update_check = true
## 啟用本地端設定檔腳本檢查
enable_local_script_checks = true
## 給定名稱，預設是使用hostname.
node_name = "consul-server-01"
## 提供給外部連線Consul使用的IP, 例如: Web UI, HTTP等，預設是”127.0.0.1”
client_addr = "10.0.2.16"
## Consul cluster內部溝通用的IP,預設是”0.0.0.0”
bind_addr = "10.0.2.16"

## 在Consul cluster中，設定該agent是否允許連線。
connect {
  enabled = true
}

## 預設是”info”，另外還有"trace", "debug", "info", "warn", and "err”.
log_level = "DEBUG"
## log file 路徑，檔名會是consul-{timestamp}.log
log_file = "/home/hsieh/prac_hashicorp/consul/logs/"
## log紀錄多久時間rotate一次
log_rotate_duration = "24h"
## 設定最多rotate幾個檔案
log_rotate_max_files = 0
## json 格式
log_json=true

## 設定 ACL 規則
acl = {
  ## 啟用ACL
  enabled = true
  ## 設定default值為全部拒絕
  default_policy = "deny"
  ## 將token的資料持久化於disk上
  enable_token_persistence = true
}

## 普羅米修斯監控
telemetry {
  prometheus_retention_time = "480h"
  disable_hostname = true
}