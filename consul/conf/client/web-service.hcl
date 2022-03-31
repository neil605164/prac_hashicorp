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