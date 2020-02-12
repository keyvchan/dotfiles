# https://github.com/crossutility/Quantumult-X/blob/master/sample.conf

[general]
server_check_url={{ proxyTestUrl }}
network_check_url={{ proxyTestUrl }}
geo_location_checker = http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js

[dns]
server = 223.5.5.5
server = 114.114.114.114
server = 119.29.29.29
server = 119.28.28.28
server = 1.2.4.8
server = 182.254.116.116

[server_remote]
{{ getDownloadUrl('QuantumultX_subscribe_us.conf') }}, tag=🇺🇸 United States
{{ getDownloadUrl('QuantumultX_subscribe_hk.conf') }}, tag=🇭🇰 Hong Kong
{{ getDownloadUrl('QuantumultX_subscribe_jp.conf') }}, tag=🇯🇵 Japan
{{ getDownloadUrl('QuantumultX_subscribe_sg.conf') }}, tag=🇸🇬 Singapore
{{ getDownloadUrl('QuantumultX_subscribe_tw.conf') }}, tag=🇹🇼 Taiwan

[policy]
available=🇺🇸 US, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
available=🇭🇰 HK, {{ getNodeNames(nodeList, customFilters.HongKongHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
available=🇯🇵 JP, {{ getNodeNames(nodeList, customFilters.JapanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Japan.png
available=🇸🇬 SG, {{ getNodeNames(nodeList, customFilters.SingaporeHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
available=🇹🇼 TW, {{ getNodeNames(nodeList, customFilters.TaiwanHighRate) }}, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Taiwan.png
static=📺 YouTube, 🇺🇸 US, 🇭🇰 HK, 🇯🇵 JP, 🇹🇼 TW, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/YouTube.png
static=🎬 Netflix, proxy, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Netflix.png
static=🍎 Apple, DIRECT, 🇺🇸 US, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🍎 Apple CDN, DIRECT, 🍎 Apple, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=📞 Telegram,   proxy, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram_X.png
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

[mitm]
passphrase = 0411D92E
p12 = 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
;passphrase =
;p12 =
;skip_validating_cert = false
;force_sni_domain_name = false
;empty_sni_enabled = false
;hostname = *.example.com, *.sample.com
