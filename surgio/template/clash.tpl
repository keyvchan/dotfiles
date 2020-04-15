# {{ downloadUrl }}

{% import './snippet/direct.tpl' as direct %}
{% import './snippet/apple.tpl' as apple %}
{% import './snippet/youtube.tpl' as youtube %}
{% import './snippet/microsoft.tpl' as microsoft %}
{% import './snippet/custom.tpl' as custom %}
{% import './snippet/netflix.tpl' as netflix %}
{% import './snippet/telegram.tpl' as telegram %}
{% import './snippet/onedrive.tpl' as OneDrive %}
{% import './snippet/hulu.tpl' as hulu %}
{% import './snippet/hbo.tpl' as hbo %}
{% import './snippet/google.tpl' as google %}
{% import './snippet/global.tpl' as global %}
{% import './snippet/pornhub.tpl' as pornhub %}

external-controller: 127.0.0.1:7892
port: 7890
socks-port: 7891

Proxy: {{ getClashNodes(nodeList) | json }}

Proxy Group:
- type: select
  name: 🚀 Proxy
  proxies: {{ getClashNodeNames(nodeList) | json }}
- type: select
  name: 🎬 Netflix
  proxies: {{ getClashNodeNames(nodeList, customFilters.AmericanHighRate, ["🚀 Proxy"]) | json }}
- type: select 
  name: 📺 YouTube 
  proxies:
    - 🚀 Proxy
    - 🇺🇸 US
    - 🇭🇰 HK 
    - 🇯🇵 JP
    - 🇸🇬 SG 
    {# - 🇹🇼 TW #}
- type: select
  name: 🌊 Google 
  proxies: 
    - 🚀 Proxy
    - 🇭🇰 HK 
    - 🇺🇸 US
- type: select
  name: 🔞 Pornhub 
  proxies: {{ getClashNodeNames(nodeList, customFilters.Korea, ["🚀 Proxy"]) | json }}  
- type: select
  name: 📲 Telegram 
  proxies:
    - 🚀 Proxy
    - 🇸🇬 SG
- type: select 
  name: 🖥 Microsoft 
  proxies:
    - DIRECT
    - 🚀 Proxy
    - 🇺🇸 US
    - 🇯🇵 JP
- type: select
  name: ☁️ OneDrive 
  proxies:
    - DIRECT
    - 🚀 Proxy
    - 🇺🇸 US
    - 🇯🇵 JP
    - 🇭🇰 HK
- type: select 
  name: 🍎 Apple 
  proxies:
    - DIRECT
    - 🚀 Proxy
    - 🇺🇸 US 
- type: select 
  name: 🍎 Apple CDN 
  proxies:
    - DIRECT
    - 🍎 Apple
- type: select
  name: 🌏 Global 
  proxies:
    - DIRECT
    - 🚀 Proxy
- type: select
  name: 🏹 Direct 
  proxies:
    - DIRECT
    - 🚀 Proxy
- type: url-test
  name: 🇺🇸 US
  proxies: {{ getClashNodeNames(nodeList, customFilters.AmericanHighRate) | json }} 
  url: {{ proxyTestUrl }}
  interval: 600
- type: url-test
  name: 🇭🇰 HK
  proxies: {{ getClashNodeNames(nodeList, customFilters.HongKongHighRate) | json }} 
  url: {{ proxyTestUrl }}
  interval: 600
- type: url-test
  name: 🇯🇵 JP
  proxies: {{ getClashNodeNames(nodeList, customFilters.JapanHighRate) | json }}
  url: {{ proxyTestUrl }}
  interval: 600
- type: url-test
  name: 🇸🇬 SG
  proxies: {{ getClashNodeNames(nodeList, customFilters.SingaporeHighRate) | json }} 
  url: {{ proxyTestUrl }}
  interval: 600
{# - type: url-test
  name: 🇹🇼 TW
  proxies: {{ getClashNodeNames(nodeList, customFilters.TaiwanHighRate) | json }} 
  url: {{ proxyTestUrl }}
  interval: 600 #}

Rule:
{{ custom.main('🚀 Proxy', '🏹 Direct') | clash }}

{{ apple.main('🚀 Proxy', '🍎 Apple', '🍎 Apple CDN', '🏹 Direct', '🇺🇸 US') | clash }}

{{ remoteSnippets.OneDrive.main('☁️ OneDrive') | clash }}

{{ microsoft.main('🖥 Microsoft') | clash}}

{{ remoteSnippets.Netflix.main('🎬 Netflix') | clash }}

{{ remoteSnippets.HBO.main('🎬 Netflix') | clash }}

{{ remoteSnippets.Hulu.main('🎬 Netflix') | clash }}

{{ remoteSnippets.Pornhub.main('🔞 Pornhub') | clash }}

{{ remoteSnippets.Telegram.main('📲 Telegram') | clash }}

{{ remoteSnippets.YouTube.main('📺 YouTube') | clash }}

{{ remoteSnippets.Google.main('🌊 Google') | clash }}

{{ remoteSnippets.Global.main('🌏 Global') | clash }}

{{ direct.main('🏹 Direct') | clash }}

{# {{ OneDrive.main('☁️ OneDrive')}} #}
{# {{ netflix.main('🎬 Netflix') }} #}
{# {{ hbo.main('🎬 Netflix') }} #}
{# {{ hulu.main('🎬 Netflix') }} #}
{# {{ pornhub.main('🔞 Pornhub')}} #}
{# {{ telegram.main('📲 Telegram') }} #}
{# {{ youtube.main('📺 YouTube') }} #}
{# {{ google.main('🌊 Google')}} #}
{# {{ global.main('🌏 Global') }} #}

# LAN
- DOMAIN-SUFFIX,local,DIRECT
- IP-CIDR,127.0.0.0/8,DIRECT
- IP-CIDR,172.16.0.0/12,DIRECT
- IP-CIDR,192.168.0.0/16,DIRECT
- IP-CIDR,10.0.0.0/8,DIRECT
- IP-CIDR,17.0.0.0/8,DIRECT
- IP-CIDR,100.64.0.0/10,DIRECT

# Final
- GEOIP,CN,DIRECT
- MATCH,🚀 Proxy
