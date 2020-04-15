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
network-framework = true
exclude-simple-hostnames = true
external-controller-access = keyv@0.0.0.0:6170
show-primary-interface-changed-notification = true
proxy-settings-interface = Primary Interface (Auto)
menu-bar-show-speed = false
allow-wifi-access = true
show-error-page-for-reject = true

[Proxy]

[Proxy Group]
🚀 Proxy = select, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy') }}
🎬 Netflix = select, 🚀 Proxy, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=AmericanHighRate')}}
📺 YouTube = select, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK, 🇯🇵 JP, 🇸🇬 SG, 🇹🇼 TW
🌊 Google = select, 🚀 Proxy, 🇭🇰 HK, 🇺🇸 US
🔞 Pornhub = select, 🚀 Proxy, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=Korea')}}
📲 Telegram = select, 🚀 Proxy, 🇸🇬 SG
🖥 Microsoft = select, DIRECT, 🚀 Proxy, 🇺🇸 US, 🇯🇵 JP
☁️ OneDrive = select, DIRECT,  🚀 Proxy, 🇺🇸 US, 🇯🇵 JP, 🇭🇰 HK
🍎 Apple = select, DIRECT, 🚀 Proxy, 🇺🇸 US 
🍎 Apple CDN = select, DIRECT, 🍎 Apple
🌏 Global = select, DIRECT,  🚀 Proxy
🏹 Direct = select, DIRECT,  🚀 Proxy
🇺🇸 US = url-test, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=AmericanHighRate') }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇭🇰 HK = url-test, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=HongKongHighRate') }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇯🇵 JP = url-test, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=JapanHighRate') }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇸🇬 SG = url-test, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=SingaporeHighRate') }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5
🇹🇼 TW = url-test, policy-path={{ getDownloadUrl('SurgeV3.conf?format=surge-policy&filter=TaiwanHighRate') }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100, timeout=5

[Rule]
{{ custom.main('🚀 Proxy', '🏹 Direct')}}

{{ apple.main('🚀 Proxy', '🍎 Apple', '🍎 Apple CDN', 'DIRECT', '🇺🇸 US') }}

{{ microsoft.main('🖥 Microsoft')}}

{{ OneDrive.main('☁️ OneDrive')}}

{{ netflix.main('🎬 Netflix') }}

{{ hbo.main('🎬 Netflix') }}

{{ hulu.main('🎬 Netflix') }}

{{ pornhub.main('🔞 Pornhub')}}

{{ telegram.main('📲 Telegram') }}

{{ youtube.main('📺 YouTube') }}

{{ google.main('🌊 Google')}}

{{ global.main('🌏 Global') }}

{{ direct.main('🏹 Direct')}}

# Rulesets
RULE-SET,SYSTEM,DIRECT

# LAN
RULE-SET,LAN,DIRECT

# GeoIP CN
GEOIP,CN,DIRECT

# Final
FINAL,🚀 Proxy,dns-failed

[URL Rewrite]

[Script]

[MITM]
skip-server-cert-verify = true
tcp-connection = true
{# hostname = *.amemv.com,*.iydsj.com,*.k.sohu.com,*.tv.sohu.com,*.kakamobi.cn,*.kingsoft-office-service.com,*.meituan.net,*.musical.ly,*.ofo.com,*.pstatp.com,*.snssdk.com,*.uve.weibo.com,*.ydstatic.com,*pi.feng.com,4gimg.map.qq.com,a.apicloud.com,a.qiumibao.com,a.wkanx.com,acs.m.taobao.com,act.vip.iqiyi.com,api.21jingji.com,api.bjxkhc.com,api.caijingmobile.com,api.chelaile.net.cn,api.daydaycook.com.cn,api.douban.com,api.gotokeep.com,api.haohaozhu.cn,api.huomao.com,api.intsig.net,api.izuiyou.com,api.jr.mi.com,api.jxedt.com,api.kkmh.com,api.m.jd.com,api.mgzf.com,api.qbb6.com,api.psy-1.com,api.resso.app,api.rr.tv,api.smzdm.com,api.vistopia.com.cn,api.waitwaitpay.com,api.wallstreetcn.com,api.xiachufang.com,api.yangkeduo.com,api.zhihu.com,api.zhuishushenqi.com,api*.tiktokv.com,api*.futunn.com,api-mifit*.huami.com,api-release.wuta-cam.com,app.58.com,app.api.ke.com,app.bilibili.com,appconf.mail.163.com,app.mixcapp.com,app.variflight.com,app.wy.guahao.com,app.yinxiang.com,app-api.smzdm.com,b.zhuishushenqi.com,business-cdn.shouji.sogou.com,c.m.163.com,cap.caocaokeji.cn,capi.mwee.cn,cdn.moji.com,channel.beitaichufang.com,cloud.189.cn,clientaccess.10086.cn,client.mail.163.com,cms.daydaycook.com.cn,consumer.fcbox.com,creditcard.ecitic.com,daoyu.sdo.com,dl.app.gtja.com,dsa-mfp.fengshows.cn,dxy.com,e.dangdang.com,easyreadfs.nosdn.127.net,enjoy.abchina.com,gateway.shouqiev.com,guide-acs.m.taobao.com,g.cdn.pengpengla.com,gw.alicdn.com,gw.csdn.net,gw-passenger.01zhuanche.com,heic.alicdn.com,huichuan.sm.cn,i.weread.qq.com,i.ys7.com,iapi.bishijie.com,iface.iqiyi.com,ih2.ireader.com,imeclient.openspeech.cn,img*.10101111cdn.com,img*.360buyimg.com,img.jiemian.com,interface.music.163.com,ios.lantouzi.com,ios.wps.cn,m*.amap.com,m.client.10010.com,m.creditcard.ecitic.com,m.ibuscloud.com,m.tuniu.com,m.yap.yahoo.com,m.youtube.com,manga.bilibili.com,mapi.mafengwo.cn,media.qyer.com,mlife.jf365.boc.cn,mob.mddcloud.com.cn,mobi.360doc.com,mp.weixin.qq.com,mrobot.pcauto.com.cn,mrobot.pconline.com.cn,ms.jr.jd.com,msspjh.emarbox.com,news.ssp.qq.com,newsso.map.qq.com,nnapp.cloudbae.cn,open.qyer.com,p.du.163.com,pic1cdn.cmbchina.com,pic*.chelaile.net,portal-xunyou.qingcdn.com,pss.txffp.com,r.inews.qq.com,render.alipay.com,restapi.iyunmai.com,resrelease.wuta-cam.com,richmanapi.jxedt.com,rtbapi.douyucdn.cn,s*.zdmimg.com,service.4gtv.tv,smkmp.96225.com,slapi.oray.net,snailsleep.net,sp.kaola.com,ss0.bdstatic.com,ssl.kohsocialapp.qq.com,static.vuevideo.net,static1.keepcdn.com,status.boohee.com,support.you.163.com,s.youtube.com,thor.weidian.com,tiku.zhan.com,weibointl.api.weibo.cn,www.bodivis.com.cn,www.dandanzan.com,www.flyertea.com,www.youtube.com,yxyapi*.drcuiyutao.com,www.zhihu.com,www.zybang.com,youtubei.googleapis.com,zhidao.baidu.com,123.59.31.1,119.18.193.135,-CustomMitM #}
enable=true
ca-passphrase = D3110575
ca-p12 = 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

