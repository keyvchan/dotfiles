#!MANAGED-CONFIG {{ downloadUrl }} interval=43200 strict=false

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


[General]
loglevel = notify
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, localhost, *.local, *.crashlytics.com
dns-server = 114.114.114.114, 1.1.1.1, 8.8.4.4, 223.5.5.5, 223.6.6.6
bypass-system = true
bypass-tun = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12
replica = false
ipv6 = false
http-listen = 0.0.0.0:6152
socks5-listen = 0.0.0.0:6153
internet-test-url = {{ proxyTestUrl }}
proxy-test-url = {{ proxyTestUrl }}
test-timeout = 10
tls-provider = network-framework
exclude-simple-hostnames = true
external-controller-access = keyv@0.0.0.0:6170
show-primary-interface-changed-notification = true
proxy-settings-interface = Primary Interface (Auto)
menu-bar-show-speed = false
allow-wifi-access = true
show-error-page-for-reject = true

[Proxy]
{{ getSurgeNodes(nodeList, customFilters.ssrpass) }}

[Proxy Group]
🚀 Proxy = select, 1️⃣ ssrpass.com, 2️⃣ pornsshub.com, 3️⃣ ssssrpass.com, 4️⃣ custom
1️⃣ ssrpass.com = select, {{ getNodeNames(nodeList, customFilters.ssrpass)}}
2️⃣ pornsshub.com = select, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=pornsshub')}}
3️⃣ ssssrpass.com = select, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=shadowsocks')}}
4️⃣ custom = select, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=custom')}}
🎬 Netflix = select, 🚀 Proxy, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}
📺 YouTube = select, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK, 🇯🇵 JP, 🇸🇬 SG, 🇹🇼 TW
🌊 Google = select, 🚀 Proxy, 🇭🇰 HK, 🇺🇸 US
🔞 Pornhub = select, 🚀 Proxy, {{ getNodeNames(nodeList, customFilters.Korea)}}, {{ getNodeNames(nodeList, customFilters.Italy)}} 
📲 Telegram = select, 🚀 Proxy, 🇸🇬 SG
🖥 Microsoft = select, DIRECT, 🚀 Proxy, 4️⃣ custom, 🇺🇸 US, 🇯🇵 JP
☁️ OneDrive = select, DIRECT,  🚀 Proxy, 4️⃣ custom, 🇺🇸 US, 🇯🇵 JP, 🇭🇰 HK
🍎 Apple = select, DIRECT, 🚀 Proxy, 🇺🇸 US 
🍎 Apple CDN = select, DIRECT, 🍎 Apple
🌏 Global = select, DIRECT,  🚀 Proxy
🏹 Direct = select, DIRECT,  🚀 Proxy
🇺🇸 US = url-test, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇭🇰 HK = url-test, {{ getNodeNames(nodeList, customFilters.HongKongHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇯🇵 JP = url-test, {{ getNodeNames(nodeList, customFilters.JapanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇸🇬 SG = url-test, {{ getNodeNames(nodeList, customFilters.SingaporeHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇹🇼 TW = url-test, {{ getNodeNames(nodeList, customFilters.TaiwanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5

[Rule]
{{ custom.main('🚀 Proxy', '🏹 Direct')}}

{{ apple.main('🚀 Proxy', '🍎 Apple', '🍎 Apple CDN', '🏹 Direct', '🇺🇸 US') }}

{{ remoteSnippets.OneDrive.main('☁️ OneDrive')}}
{# {{ OneDrive.main('☁️ OneDrive')}} #}

{{ microsoft.main('🖥 Microsoft')}}

{# {{ netflix.main('🎬 Netflix') }} #}
{{ remoteSnippets.Netflix.main('🎬 Netflix') }}

{# {{ hbo.main('🎬 Netflix') }} #}
{{ remoteSnippets.HBO.main('🎬 Netflix') }}

{# {{ hulu.main('🎬 Netflix') }} #}
{{ remoteSnippets.Hulu.main('🎬 Netflix') }}

{# {{ pornhub.main('🔞 Pornhub')}} #}
{{ remoteSnippets.Pornhub.main('🔞 Pornhub')}}

{{ remoteSnippets.Telegram.main('📲 Telegram') }}
{# {{ telegram.main('📲 Telegram') }} #}

{# {{ youtube.main('📺 YouTube') }} #}
{{ remoteSnippets.YouTube.main('📺 YouTube') }}

{# {{ google.main('🌊 Google')}} #}
{{ remoteSnippets.Google.main('🌊 Google')}}

{# {{ global.main('🌏 Global') }} #}
{{ remoteSnippets.Global.main('🌏 Global') }}

{{ direct.main('🏹 Direct')}}

# Rulesets
RULE-SET,SYSTEM,DIRECT

# LAN
RULE-SET,LAN,DIRECT

# GeoIP CN
GEOIP,CN,🏹 Direct

# Final
FINAL,🚀 Proxy,dns-failed

[URL Rewrite]

[Script]

[MITM]
skip-server-cert-verify = true
tcp-connection = true
{# hostname = *.amemv.com,*.iydsj.com,*.k.sohu.com,*.tv.sohu.com,*.kakamobi.cn,*.kingsoft-office-service.com,*.meituan.net,*.musical.ly,*.ofo.com,*.pstatp.com,*.snssdk.com,*.uve.weibo.com,*.ydstatic.com,*pi.feng.com,4gimg.map.qq.com,a.apicloud.com,a.qiumibao.com,a.wkanx.com,acs.m.taobao.com,act.vip.iqiyi.com,api.21jingji.com,api.bjxkhc.com,api.caijingmobile.com,api.chelaile.net.cn,api.daydaycook.com.cn,api.douban.com,api.gotokeep.com,api.haohaozhu.cn,api.huomao.com,api.intsig.net,api.izuiyou.com,api.jr.mi.com,api.jxedt.com,api.kkmh.com,api.m.jd.com,api.mgzf.com,api.qbb6.com,api.psy-1.com,api.resso.app,api.rr.tv,api.smzdm.com,api.vistopia.com.cn,api.waitwaitpay.com,api.wallstreetcn.com,api.xiachufang.com,api.yangkeduo.com,api.zhihu.com,api.zhuishushenqi.com,api*.tiktokv.com,api*.futunn.com,api-mifit*.huami.com,api-release.wuta-cam.com,app.58.com,app.api.ke.com,app.bilibili.com,appconf.mail.163.com,app.mixcapp.com,app.variflight.com,app.wy.guahao.com,app.yinxiang.com,app-api.smzdm.com,b.zhuishushenqi.com,business-cdn.shouji.sogou.com,c.m.163.com,cap.caocaokeji.cn,capi.mwee.cn,cdn.moji.com,channel.beitaichufang.com,cloud.189.cn,clientaccess.10086.cn,client.mail.163.com,cms.daydaycook.com.cn,consumer.fcbox.com,creditcard.ecitic.com,daoyu.sdo.com,dl.app.gtja.com,dsa-mfp.fengshows.cn,dxy.com,e.dangdang.com,easyreadfs.nosdn.127.net,enjoy.abchina.com,gateway.shouqiev.com,guide-acs.m.taobao.com,g.cdn.pengpengla.com,gw.alicdn.com,gw.csdn.net,gw-passenger.01zhuanche.com,heic.alicdn.com,huichuan.sm.cn,i.weread.qq.com,i.ys7.com,iapi.bishijie.com,iface.iqiyi.com,ih2.ireader.com,imeclient.openspeech.cn,img*.10101111cdn.com,img*.360buyimg.com,img.jiemian.com,interface.music.163.com,ios.lantouzi.com,ios.wps.cn,m*.amap.com,m.client.10010.com,m.creditcard.ecitic.com,m.ibuscloud.com,m.tuniu.com,m.yap.yahoo.com,m.youtube.com,manga.bilibili.com,mapi.mafengwo.cn,media.qyer.com,mlife.jf365.boc.cn,mob.mddcloud.com.cn,mobi.360doc.com,mp.weixin.qq.com,mrobot.pcauto.com.cn,mrobot.pconline.com.cn,ms.jr.jd.com,msspjh.emarbox.com,news.ssp.qq.com,newsso.map.qq.com,nnapp.cloudbae.cn,open.qyer.com,p.du.163.com,pic1cdn.cmbchina.com,pic*.chelaile.net,portal-xunyou.qingcdn.com,pss.txffp.com,r.inews.qq.com,render.alipay.com,restapi.iyunmai.com,resrelease.wuta-cam.com,richmanapi.jxedt.com,rtbapi.douyucdn.cn,s*.zdmimg.com,service.4gtv.tv,smkmp.96225.com,slapi.oray.net,snailsleep.net,sp.kaola.com,ss0.bdstatic.com,ssl.kohsocialapp.qq.com,static.vuevideo.net,static1.keepcdn.com,status.boohee.com,support.you.163.com,s.youtube.com,thor.weidian.com,tiku.zhan.com,weibointl.api.weibo.cn,www.bodivis.com.cn,www.dandanzan.com,www.flyertea.com,www.youtube.com,yxyapi*.drcuiyutao.com,www.zhihu.com,www.zybang.com,youtubei.googleapis.com,zhidao.baidu.com,123.59.31.1,119.18.193.135,-CustomMitM #}
enable=true
ca-passphrase = 
ca-p12 = 

