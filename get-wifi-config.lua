do
local sta_config=wifi.sta.getconfig(true)
print(string.format("\tCurrent station config\n\tssid:\"%s\"\tpassword:\"%s\"\n\tbssid:\"%s\"\tbssid_set:%s", sta_config.ssid, sta_config.pwd, sta_config.bssid, (sta_config.bssid_set and "true" or "false")))
end
