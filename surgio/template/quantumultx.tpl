# https://github.com/crossutility/Quantumult-X/blob/master/sample.conf

[general]
server_check_url={{ proxyTestUrl }}
network_check_url={{ proxyTestUrl }}
geo_location_checker = http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js

[dns]
server = 114.114.114.114
server = 223.5.5.5
server = 119.29.29.29
server = 119.28.28.28
server = 1.2.4.8
server = 182.254.116.116

[server_remote]
{{ getDownloadUrl('QuantumultX_subscribe_kr.conf') }}, tag=🇰🇷 Korea
{{ getDownloadUrl('QuantumultX_subscribe_us.conf') }}, tag=🇺🇸 United States
{{ getDownloadUrl('QuantumultX_subscribe_hk.conf') }}, tag=🇭🇰 Hong Kong
{{ getDownloadUrl('QuantumultX_subscribe_jp.conf') }}, tag=🇯🇵 Japan
{{ getDownloadUrl('QuantumultX_subscribe_sg.conf') }}, tag=🇸🇬 Singapore
{{ getDownloadUrl('QuantumultX_subscribe_tw.conf') }}, tag=🇹🇼 Taiwan
{{ getDownloadUrl('QuantumultX_subscribe_pornsshub.conf') }}, tag=🚗 Pornsshub

[server_local]
{{ getQuantumultXNodes(nodeList, customFilters.custom)}}

[policy]
available=🇺🇸 US, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
available=🇭🇰 HK, {{ getNodeNames(nodeList, customFilters.HongKongHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
available=🇯🇵 JP, {{ getNodeNames(nodeList, customFilters.JapanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Japan.png
available=🇸🇬 SG, {{ getNodeNames(nodeList, customFilters.SingaporeHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
available=🇹🇼 TW, {{ getNodeNames(nodeList, customFilters.TaiwanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Taiwan.png
static=📺 YouTube, 🇺🇸 US, 🇭🇰 HK, 🇯🇵 JP, 🇹🇼 TW, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/YouTube.png
static=🌊 Google, proxy, 🇭🇰 HK, 🇺🇸 US, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Google.png
static=🎬 Netflix, proxy, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Netflix.png
static=🔞 Pornhub, proxy, {{ getNodeNames(nodeList, customFilters.Korea) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Pornhub.png
static=🍎 Apple, DIRECT, 🇺🇸 US,  img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🍎 Apple CDN, DIRECT, 🍎 Apple, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=📞 Telegram, proxy, 🇸🇬 SG, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram_X.png
static=🖥 Microsoft, DIRECT, proxy, 🇺🇸 US,  🇯🇵 JP, img-url=https://raw.githubusercontent.com/GeQ1an/Rules/master/QuantumultX/IconSet/Microsoft.png
static=☁️ OneDrive, DIRECT,  proxy, 🇺🇸 US, 🇯🇵 JP, 🇭🇰 HK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/OneDrive.png
static=🌏 Global, DIRECT, proxy, img-url=https://raw.githubusercontent.com/GeQ1an/Rules/master/QuantumultX/IconSet/Outside.png
static=🏹 Direct, DIRECT, proxy, img-url=https://raw.githubusercontent.com/GeQ1an/Rules/master/QuantumultX/IconSet/Mainland.png

[filter_remote]
{{ getDownloadUrl('QuantumultX_rules.conf') }}, tag=分流规则

[filter_local]
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
geoip, cn, direct
final, proxy

[rewrite_local]

[rewrite_remote]

[mitm]
passphrase = CA
p12 = MITM
;passphrase =
;p12 =
;skip_validating_cert = false
;force_sni_domain_name = false
;empty_sni_enabled = false
;hostname = *.example.com, *.sample.com
