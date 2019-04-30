-- add wifi listener
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
    print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
    T.BSSID.."\n\tChannel: "..T.channel)
    -- send message
    srv = net.createConnection(net.TCP, 0)
    srv:on("receive", function(sck, c) print(c) end)
    srv:on("connection", function(sck, c)
        print("send to 192.168.5.180:8000")
        sck:send("hello world")
    end)
    srv:connect(8000,"192.168.5.180")
    print("connect to 192.168.5.180:8000")
end)

wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
    print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
    T.BSSID.."\n\treason: "..T.reason)
end)

wifi.eventmon.register(wifi.eventmon.STA_AUTHMODE_CHANGE, function(T)
    print("\n\tSTA - AUTHMODE CHANGE".."\n\told_auth_mode: "..
    T.old_auth_mode.."\n\tnew_auth_mode: "..T.new_auth_mode)
end)

wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
    print("\n\tSTA - GOT IP".."\n\tStation IP: "..T.IP.."\n\tSubnet mask: "..
    T.netmask.."\n\tGateway IP: "..T.gateway)
end)

wifi.eventmon.register(wifi.eventmon.STA_DHCP_TIMEOUT, function()
    print("\n\tSTA - DHCP TIMEOUT")
end)

wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function(T)
    print("\n\tAP - STATION CONNECTED".."\n\tMAC: "..T.MAC.."\n\tAID: "..T.AID)
end)

wifi.eventmon.register(wifi.eventmon.AP_STADISCONNECTED, function(T)
    print("\n\tAP - STATION DISCONNECTED".."\n\tMAC: "..T.MAC.."\n\tAID: "..T.AID)
end)

wifi.eventmon.register(wifi.eventmon.AP_PROBEREQRECVED, function(T)
    print("\n\tAP - PROBE REQUEST RECEIVED".."\n\tMAC: ".. T.MAC.."\n\tRSSI: "..T.RSSI)
end)

wifi.eventmon.register(wifi.eventmon.WIFI_MODE_CHANGED, function(T)
    print("\n\tSTA - WIFI MODE CHANGED".."\n\told_mode: "..
    T.old_mode.."\n\tnew_mode: "..T.new_mode)
end)

-- connect to ap
station_cfg={}
station_cfg.ssid="jin"
station_cfg.pwd="12341234"
station_cfg.save=true
wifi.sta.config(station_cfg)

--wifi.sta.connect()
wifi.sta.autoconnect(1)

-- send message
srv = net.createConnection(net.TCP, 0)
srv:on("receive", function(sck, c) print(c) end)
srv:on("connection", function(sck, c)
    sck:send("hello world")
end)
srv:connect(8000,"192.168.5.180")

dofile('remove-all-file.lua')
