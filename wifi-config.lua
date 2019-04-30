-- connect to ap
station_cfg={}
station_cfg.ssid="jin"
station_cfg.pwd="12341234"
station_cfg.save=true
wifi.sta.config(station_cfg)

wifi.sta.connect()
