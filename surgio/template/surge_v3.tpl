#!MANAGED-CONFIG {{ downloadUrl }} interval=43200 strict=false

{% import './snippet/direct_rules.tpl' as direct_rules %}
{% import './snippet/apple_rules.tpl' as apple_rules %}
{% import './snippet/youtube_rules.tpl' as youtube_rules %}
{% import './snippet/us_rules.tpl' as us_rules %}
{% import './snippet/blocked_rules.tpl' as blocked_rules %}
{% import './snippet/microsoft.tpl' as microsoft_rules %}

[General]
# 日志等级: warning, notify, info, verbose (默认值: notify)
loglevel = notify
# 跳过某个域名或者 IP 段，这些目标主机将不会由 Surge Proxy 处理。(在 macOS
# 版本中，如果启用了 Set as System Proxy,  那么这些值会被写入到系统网络代理
# 设置中.)
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 100.84.0.0/10, localhost, *.local
# 强制使用特定的 DNS 服务器
dns-server = 119.29.29.29, 223.5.5.5, 1.1.1.1

# 以下参数仅供 iOS 版本使用
# 将系统相关请求交给 Surge TUN 处理，并自动追加规则
# "IP-CIDR,17.0.0.0/8,DIRECT,no-resolve"
bypass-system = true
# 将特定 IP 段跳过 Surge TUN，详见 Manual
bypass-tun = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12
# 是否截取并保存 HTTP 流量 (启用后将对性能有较大影响) (默认值: false)
replica = false
# 是否启动完整的 IPv6 支持 (默认值: false)
ipv6 = false

# 以下参数仅供 macOS 版本使用（多端口监听仅 Surge 3 支持）
http-listen = 0.0.0.0:6152
socks5-listen = 0.0.0.0:6153

# 测速地址
internet-test-url = {{ proxyTestUrl }}
proxy-test-url = {{ proxyTestUrl }}

# 其它
# external-controller-access = password@0.0.0.0:6170
show-primary-interface-changed-notification = true
proxy-settings-interface = Primary Interface (Auto)
menu-bar-show-speed = false
allow-wifi-access = true
hide-crashlytics-request = true

[Proxy]
{{ getSurgeNodes(nodeList) }}

[Proxy Group]
🚀 Proxy = select, {{ getNodeNames(nodeList) }}
🎬 Netflix = select, 🚀 Proxy
📺 YouTube = select, 🚀 Proxy, 🇭🇰 HK, 🇯🇵 JP, 🇸🇬 SG, 🇹🇼 TW
🌏 Google = select, 🚀 Proxy, 🇭🇰 HK, 🇺🇸 US
🖥 Microsoft = select, DIRECT, 🚀 Proxy, 🇺🇸 US, 🇯🇵 JP
☁️ OneDrive = select, DIRECT,  🚀 Proxy, 🇺🇸 US, 🇯🇵 JP, 🇭🇰 HK
🍎 Apple = select, DIRECT, 🚀 Proxy, 🇺🇸 US 
🍎 Apple CDN = select, DIRECT, 🍎 Apple
🇺🇸 US = url-test, {{ getNodeNames(nodeList, customFilters.AmericanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100
🇭🇰 HK = url-test, {{ getNodeNames(nodeList, customFilters.HongKongHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100
🇯🇵 JP = url-test, {{ getNodeNames(nodeList, customFilters.JapanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100
🇸🇬 SG = url-test, {{ getNodeNames(nodeList, singaporeFilter) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100
🇹🇼 TW = url-test, {{ getNodeNames(nodeList, customFilters.TaiwanHighRate) }}, url = {{ proxyTestUrl }}, interval = 300, tolerance = 100

[Rule]
{{ apple_rules.main('🚀 Proxy', '🍎 Apple', '🍎 Apple CDN', 'DIRECT', '🇺🇸 US') }}

{{ microsoft_rules.main('🖥 Microsoft')}}

{{ remoteSnippets.OneDrive.main('☁️ OneDrive')}}

{{ remoteSnippets.netflix.main('🎬 Netflix') }}

{{ remoteSnippets.hbo.main('🎬 Netflix') }}

{{ remoteSnippets.hulu.main('🚀 Proxy') }}

{{ remoteSnippets.telegram.main('🚀 Proxy') }}

{{ remoteSnippets.youtube.main('📺 YouTube') }}

{{ remoteSnippets.google.main('🇭🇰 HK')}}

{{ remoteSnippets.global.main('🚀 Proxy') }}

{{ direct_rules.main('DIRECT')}}

{{ remoteSnippets.China.main('DIRECT') }}

# Rulesets
RULE-SET,SYSTEM,DIRECT

# LAN
RULE-SET,LAN,DIRECT

# GeoIP CN
GEOIP,CN,DIRECT

# Final
FINAL,🚀 Proxy,dns-failed

[URL Rewrite]
# Redirect Google Search Service
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

# Redirect HTTP to HTTPS
^https?:\/\/(www.)?taobao\.com\/ https://taobao.com/ 302
^https?:\/\/(www.)?jd\.com\/ https://www.jd.com/ 302
^https?:\/\/(www.)?mi\.com\/ https://www.mi.com/ 302
^https?:\/\/you\.163\.com\/ https://you.163.com/ 302
^https?:\/\/(www.)?suning\.com/ https://suning.com/ 302
^https?:\/\/(www.)?yhd\.com https://yhd.com/ 302

# Redirect False to True
# > IGN China to IGN Global
^https?:\/\/(www.)?ign\.xn--fiqs8s\/ http://cn.ign.com/ccpref/us 302
# > Fake Website Made By C&J Marketing
^https?:\/\/(www.)?abbyychina\.com\/ https://www.abbyy.cn/ 302
^https?:\/\/(www.)?bartender\.cc\/ https://www.macbartender.com/ 302
^https?:\/\/(www.)?(betterzipcn|betterzip)\.(com|net)\/ https://macitbetter.com/ 302
^https?:\/\/(www.)?beyondcompare\.cc\/ https://www.scootersoftware.com/ 302
^https?:\/\/(www.)?bingdianhuanyuan\.cn\/ https://www.faronics.com/zh-hans/products/deep-freeze 302
^https?:\/\/(www.)?chemdraw\.com\.cn\/ https://www.perkinelmer.com.cn/ 302
^https?:\/\/(www.)?codesoftchina\.com\/ https://www.teklynx.com/ 302
^https?:\/\/(www.)?coreldrawchina\.com\/ https://www.coreldraw.com/cn/ 302
^https?:\/\/(www.)?crossoverchina\.com\/ https://www.codeweavers.com/ 302
^https?:\/\/(www.)?dongmansoft\.com\/ https://www.udongman.cn/ 302
^https?:\/\/(www.)?earmasterchina\.cn\/ https://www.earmaster.com/ 302
^https?:\/\/(www.)?easyrecoverychina\.com\/ https://www.ontrack.com/ 302
^https?:\/\/(www.)?ediuschina\.com\/ https://www.grassvalley.com/ 302
^https?:\/\/(www.)?flstudiochina\.com\/ https://www.image-line.com/ 302
^https?:\/\/(www.)?formysql\.com\/ https://www.navicat.com.cn/ 302
^https?:\/\/(www.)?guitarpro\.cc\/ https://www.guitar-pro.com/ 302
^https?:\/\/(www.)?huishenghuiying\.com\.cn\/ https://www.coreldraw.com/cn/ 302
^https?:\/\/hypersnap\.mairuan\.com\/ https://www.hyperionics.com/ 302
^https?:\/\/(www.)?iconworkshop\.cn\/ https://www.axialis.com/ 302
^https?:\/\/(www.)?imindmap\.cc\/ https://www.ayoa.com/previously-imindmap/ 302
^https?:\/\/(www.)?jihehuaban\.com\.cn\/ https://www.chartwellyorke.com/sketchpad/x24795.html
^https?:\/\/hypersnap\.mairuan\.com\/ https://www.keyshot.com/ 302
^https?:\/\/(www.)?kingdeecn\.cn\/ http://www.kingdee.com/ 302
^https?:\/\/(www.)?logoshejishi\.com https://www.sothink.com/product/logo-design-software/ 302
^https?:\/\/logoshejishi\.mairuan\.com\/ https://www.sothink.com/product/logo-design-software/ 302
^https?:\/\/(www.)?luping\.net\.cn\/ https://www.techsmith.com/ 302
^https?:\/\/(www.)?mathtype\.cn\/ https://www.dessci.com/ 302
^https?:\/\/(www.)?mindmanager\.(cc|cn)\/ https://www.mindjet.com/cn/ 302
^https?:\/\/(www.)?mindmapper\.cc\/ https://www.mindmapper.com/ 302
^https?:\/\/(www.)?mycleanmymac\.com\/ https://macpaw.com/ 302
^https?:\/\/(www.)?nicelabel\.cc\/ https://www.nicelabel.com/zh/ 302
^https?:\/\/(www.)?ntfsformac\.cc\/ https://www.tuxera.com/products/tuxera-ntfs-for-mac-cn/ 302
^https?:\/\/(www.)?ntfsformac\.cn\/ https://china.paragon-software.com/home-mac/ntfs-for-mac/ 302
^https?:\/\/(www.)?overturechina\.com\/ https://sonicscores.com/ 302
^https?:\/\/(www.)?passwordrecovery\.cn\/ https://cn.elcomsoft.com/aopr.html 302
^https?:\/\/(www.)?pdfexpert\.cc\/ https://pdfexpert.com/zh 302
^https?:\/\/(www.)?photozoomchina\.com\/ https://www.benvista.com/ 302
^https?:\/\/(www.)?shankejingling\.com\/ https://www.sothink.com/product/flashdecompiler/ 302
^https?:\/\/cn\.ultraiso\.net\/ https://cn.ezbsystems.com/ultraiso/ 302
^https?:\/\/(www.)?vegaschina\.cn\/ https://www.vegascreativesoftware.com/ 302
^https?:\/\/(www.)?xshellcn\.com\/ https://www.netsarang.com/zh/xshell/ 302
^https?:\/\/(www.)?yuanchengxiezuo\.com\/ https://www.teamviewer.com/ 302
^https?:\/\/(www.)?zbrushcn.com/ https://pixologic.com/ 302

[Script]
http-response ^https?:\/\/m\.poizon\.com\/client\/init script-path=https://github.com/ConnersHua/Profiles/raw/master/Surge/Script/com.poizon.js,requires-body=true

[MITM]
skip-server-cert-verify = true
tcp-connection = true
hostname = *.amemv.com,*.iydsj.com,*.k.sohu.com,*.tv.sohu.com,*.kakamobi.cn,*.kingsoft-office-service.com,*.meituan.net,*.musical.ly,*.ofo.com,*.pstatp.com,*.snssdk.com,*.uve.weibo.com,*.ydstatic.com,*pi.feng.com,4gimg.map.qq.com,a.apicloud.com,a.qiumibao.com,a.wkanx.com,acs.m.taobao.com,act.vip.iqiyi.com,api.21jingji.com,api.bjxkhc.com,api.caijingmobile.com,api.chelaile.net.cn,api.daydaycook.com.cn,api.douban.com,api.gotokeep.com,api.haohaozhu.cn,api.huomao.com,api.intsig.net,api.izuiyou.com,api.jr.mi.com,api.jxedt.com,api.kkmh.com,api.m.jd.com,api.mgzf.com,api.qbb6.com,api.psy-1.com,api.resso.app,api.rr.tv,api.smzdm.com,api.vistopia.com.cn,api.waitwaitpay.com,api.wallstreetcn.com,api.xiachufang.com,api.yangkeduo.com,api.zhihu.com,api.zhuishushenqi.com,api*.tiktokv.com,api*.futunn.com,api-mifit*.huami.com,api-release.wuta-cam.com,app.58.com,app.api.ke.com,app.bilibili.com,appconf.mail.163.com,app.mixcapp.com,app.variflight.com,app.wy.guahao.com,app.yinxiang.com,app-api.smzdm.com,b.zhuishushenqi.com,business-cdn.shouji.sogou.com,c.m.163.com,cap.caocaokeji.cn,capi.mwee.cn,cdn.moji.com,channel.beitaichufang.com,cloud.189.cn,clientaccess.10086.cn,client.mail.163.com,cms.daydaycook.com.cn,consumer.fcbox.com,creditcard.ecitic.com,daoyu.sdo.com,dl.app.gtja.com,dsa-mfp.fengshows.cn,dxy.com,e.dangdang.com,easyreadfs.nosdn.127.net,enjoy.abchina.com,gateway.shouqiev.com,guide-acs.m.taobao.com,g.cdn.pengpengla.com,gw.alicdn.com,gw.csdn.net,gw-passenger.01zhuanche.com,heic.alicdn.com,huichuan.sm.cn,i.weread.qq.com,i.ys7.com,iapi.bishijie.com,iface.iqiyi.com,ih2.ireader.com,imeclient.openspeech.cn,img*.10101111cdn.com,img*.360buyimg.com,img.jiemian.com,interface.music.163.com,ios.lantouzi.com,ios.wps.cn,m*.amap.com,m.client.10010.com,m.creditcard.ecitic.com,m.ibuscloud.com,m.tuniu.com,m.yap.yahoo.com,m.youtube.com,manga.bilibili.com,mapi.mafengwo.cn,media.qyer.com,mlife.jf365.boc.cn,mob.mddcloud.com.cn,mobi.360doc.com,mp.weixin.qq.com,mrobot.pcauto.com.cn,mrobot.pconline.com.cn,ms.jr.jd.com,msspjh.emarbox.com,news.ssp.qq.com,newsso.map.qq.com,nnapp.cloudbae.cn,open.qyer.com,p.du.163.com,pic1cdn.cmbchina.com,pic*.chelaile.net,portal-xunyou.qingcdn.com,pss.txffp.com,r.inews.qq.com,render.alipay.com,restapi.iyunmai.com,resrelease.wuta-cam.com,richmanapi.jxedt.com,rtbapi.douyucdn.cn,s*.zdmimg.com,service.4gtv.tv,smkmp.96225.com,slapi.oray.net,snailsleep.net,sp.kaola.com,ss0.bdstatic.com,ssl.kohsocialapp.qq.com,static.vuevideo.net,static1.keepcdn.com,status.boohee.com,support.you.163.com,s.youtube.com,thor.weidian.com,tiku.zhan.com,weibointl.api.weibo.cn,www.bodivis.com.cn,www.dandanzan.com,www.flyertea.com,www.youtube.com,yxyapi*.drcuiyutao.com,www.zhihu.com,www.zybang.com,youtubei.googleapis.com,zhidao.baidu.com,123.59.31.1,119.18.193.135,-CustomMitM
enable=true
ca-passphrase = D3110575
ca-p12 = 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

