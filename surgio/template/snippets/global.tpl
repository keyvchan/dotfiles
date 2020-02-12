{% macro main(rule) %}
# (DNS Cache Pollution Protection)
# > Google
DOMAIN-SUFFIX,ampproject.org,{{ rule }}
DOMAIN-SUFFIX,appspot.com,{{ rule }}
DOMAIN-SUFFIX,blogger.com,{{ rule }}
DOMAIN-SUFFIX,getoutline.org,{{ rule }}
DOMAIN-SUFFIX,gvt0.com,{{ rule }}
DOMAIN-SUFFIX,gvt1.com,{{ rule }}
DOMAIN-SUFFIX,gvt3.com,{{ rule }}
DOMAIN-SUFFIX,xn--ngstr-lra8j.com,{{ rule }}
DOMAIN-KEYWORD,google,{{ rule }}
DOMAIN-KEYWORD,blogspot,{{ rule }}
# > Microsoft
DOMAIN-SUFFIX,onedrive.live.com,{{ rule }}
DOMAIN-SUFFIX,xboxlive.com,{{ rule }}
# > Facebook
DOMAIN-SUFFIX,cdninstagram.com,{{ rule }}
DOMAIN-SUFFIX,fb.com,{{ rule }}
DOMAIN-SUFFIX,fb.me,{{ rule }}
DOMAIN-SUFFIX,fbaddins.com,{{ rule }}
DOMAIN-SUFFIX,fbcdn.net,{{ rule }}
DOMAIN-SUFFIX,fbsbx.com,{{ rule }}
DOMAIN-SUFFIX,fbworkmail.com,{{ rule }}
DOMAIN-SUFFIX,instagram.com,{{ rule }}
DOMAIN-SUFFIX,m.me,{{ rule }}
DOMAIN-SUFFIX,messenger.com,{{ rule }}
DOMAIN-SUFFIX,oculus.com,{{ rule }}
DOMAIN-SUFFIX,oculuscdn.com,{{ rule }}
DOMAIN-SUFFIX,rocksdb.org,{{ rule }}
DOMAIN-SUFFIX,whatsapp.com,{{ rule }}
DOMAIN-SUFFIX,whatsapp.net,{{ rule }}
DOMAIN-KEYWORD,facebook,{{ rule }}
IP-CIDR,3.123.36.126/32,{{ rule }},no-resolve
IP-CIDR,35.157.215.84/32,{{ rule }},no-resolve
IP-CIDR,35.157.217.255/32,{{ rule }},no-resolve
IP-CIDR,52.58.209.134/32,{{ rule }},no-resolve
IP-CIDR,54.93.124.31/32,{{ rule }},no-resolve
IP-CIDR,54.162.243.80/32,{{ rule }},no-resolve
IP-CIDR,54.173.34.141/32,{{ rule }},no-resolve
IP-CIDR,54.235.23.242/32,{{ rule }},no-resolve
IP-CIDR,169.45.248.118/32,{{ rule }},no-resolve
# > Twitter
DOMAIN-SUFFIX,pscp.tv,{{ rule }}
DOMAIN-SUFFIX,periscope.tv,{{ rule }}
DOMAIN-SUFFIX,t.co,{{ rule }}
DOMAIN-SUFFIX,twimg.co,{{ rule }}
DOMAIN-SUFFIX,twimg.com,{{ rule }}
DOMAIN-SUFFIX,twitpic.com,{{ rule }}
DOMAIN-SUFFIX,vine.co,{{ rule }}
DOMAIN-KEYWORD,twitter,{{ rule }}
# > Telegram
DOMAIN-SUFFIX,t.me,{{ rule }}
DOMAIN-SUFFIX,tdesktop.com,{{ rule }}
DOMAIN-SUFFIX,telegra.ph,{{ rule }}
DOMAIN-SUFFIX,telegram.me,{{ rule }}
DOMAIN-SUFFIX,telegram.org,{{ rule }}
IP-CIDR,91.108.4.0/22,{{ rule }},no-resolve
IP-CIDR,91.108.8.0/22,{{ rule }},no-resolve
IP-CIDR,91.108.12.0/22,{{ rule }},no-resolve
IP-CIDR,91.108.16.0/22,{{ rule }},no-resolve
IP-CIDR,91.108.56.0/22,{{ rule }},no-resolve
IP-CIDR,149.154.160.0/20,{{ rule }},no-resolve
IP-CIDR6,2001:b28:f23d::/48,{{ rule }},no-resolve
IP-CIDR6,2001:b28:f23f::/48,{{ rule }},no-resolve
IP-CIDR6,2001:67c:4e8::/48,{{ rule }},no-resolve
# > Line
DOMAIN-SUFFIX,line.me,{{ rule }}
DOMAIN-SUFFIX,line-apps.com,{{ rule }}
DOMAIN-SUFFIX,line-scdn.net,{{ rule }}
DOMAIN-SUFFIX,naver.jp,{{ rule }}
IP-CIDR,103.2.30.0/23,{{ rule }},no-resolve
IP-CIDR,125.209.208.0/20,{{ rule }},no-resolve
IP-CIDR,147.92.128.0/17,{{ rule }},no-resolve
IP-CIDR,203.104.144.0/21,{{ rule }},no-resolve
# > Other
DOMAIN-SUFFIX,4shared.com,{{ rule }}
DOMAIN-SUFFIX,520cc.cc,{{ rule }}
DOMAIN-SUFFIX,881903.com,{{ rule }}
DOMAIN-SUFFIX,9cache.com,{{ rule }}
DOMAIN-SUFFIX,9gag.com,{{ rule }}
DOMAIN-SUFFIX,abc.com,{{ rule }}
DOMAIN-SUFFIX,abc.net.au,{{ rule }}
DOMAIN-SUFFIX,abebooks.com,{{ rule }}
DOMAIN-SUFFIX,amazon.co.jp,{{ rule }}
DOMAIN-SUFFIX,apigee.com,{{ rule }}
DOMAIN-SUFFIX,apk-dl.com,{{ rule }}
DOMAIN-SUFFIX,apkfind.com,{{ rule }}
DOMAIN-SUFFIX,apkmirror.com,{{ rule }}
DOMAIN-SUFFIX,apkmonk.com,{{ rule }}
DOMAIN-SUFFIX,apkpure.com,{{ rule }}
DOMAIN-SUFFIX,aptoide.com,{{ rule }}
DOMAIN-SUFFIX,archive.is,{{ rule }}
DOMAIN-SUFFIX,archive.org,{{ rule }}
DOMAIN-SUFFIX,arte.tv,{{ rule }}
DOMAIN-SUFFIX,artstation.com,{{ rule }}
DOMAIN-SUFFIX,arukas.io,{{ rule }}
DOMAIN-SUFFIX,ask.com,{{ rule }}
DOMAIN-SUFFIX,avg.com,{{ rule }}
DOMAIN-SUFFIX,avgle.com,{{ rule }}
DOMAIN-SUFFIX,badoo.com,{{ rule }}
DOMAIN-SUFFIX,bandwagonhost.com,{{ rule }}
DOMAIN-SUFFIX,bbc.com,{{ rule }}
DOMAIN-SUFFIX,behance.net,{{ rule }}
DOMAIN-SUFFIX,bibox.com,{{ rule }}
DOMAIN-SUFFIX,biggo.com.tw,{{ rule }}
DOMAIN-SUFFIX,binance.com,{{ rule }}
DOMAIN-SUFFIX,bitcointalk.org,{{ rule }}
DOMAIN-SUFFIX,bitfinex.com,{{ rule }}
DOMAIN-SUFFIX,bitmex.com,{{ rule }}
DOMAIN-SUFFIX,bit-z.com,{{ rule }}
DOMAIN-SUFFIX,bloglovin.com,{{ rule }}
DOMAIN-SUFFIX,bloomberg.cn,{{ rule }}
DOMAIN-SUFFIX,bloomberg.com,{{ rule }}
DOMAIN-SUFFIX,blubrry.com,{{ rule }}
DOMAIN-SUFFIX,book.com.tw,{{ rule }}
DOMAIN-SUFFIX,booklive.jp,{{ rule }}
DOMAIN-SUFFIX,books.com.tw,{{ rule }}
DOMAIN-SUFFIX,boslife.net,{{ rule }}
DOMAIN-SUFFIX,box.com,{{ rule }}
DOMAIN-SUFFIX,businessinsider.com,{{ rule }}
DOMAIN-SUFFIX,bwh1.net,{{ rule }}
DOMAIN-SUFFIX,castbox.fm,{{ rule }}
DOMAIN-SUFFIX,cbc.ca,{{ rule }}
DOMAIN-SUFFIX,cdw.com,{{ rule }}
DOMAIN-SUFFIX,change.org,{{ rule }}
DOMAIN-SUFFIX,channelnewsasia.com,{{ rule }}
DOMAIN-SUFFIX,ck101.com,{{ rule }}
DOMAIN-SUFFIX,clarionproject.org,{{ rule }}
DOMAIN-SUFFIX,clyp.it,{{ rule }}
DOMAIN-SUFFIX,cna.com.tw,{{ rule }}
DOMAIN-SUFFIX,comparitech.com,{{ rule }}
DOMAIN-SUFFIX,conoha.jp,{{ rule }}
DOMAIN-SUFFIX,crucial.com,{{ rule }}
DOMAIN-SUFFIX,cts.com.tw,{{ rule }}
DOMAIN-SUFFIX,cw.com.tw,{{ rule }}
DOMAIN-SUFFIX,cyberctm.com,{{ rule }}
DOMAIN-SUFFIX,dailymotion.com,{{ rule }}
DOMAIN-SUFFIX,dailyview.tw,{{ rule }}
DOMAIN-SUFFIX,daum.net,{{ rule }}
DOMAIN-SUFFIX,daumcdn.net,{{ rule }}
DOMAIN-SUFFIX,dcard.tw,{{ rule }}
DOMAIN-SUFFIX,deepdiscount.com,{{ rule }}
DOMAIN-SUFFIX,depositphotos.com,{{ rule }}
DOMAIN-SUFFIX,deviantart.com,{{ rule }}
DOMAIN-SUFFIX,disconnect.me,{{ rule }}
DOMAIN-SUFFIX,discordapp.com,{{ rule }}
DOMAIN-SUFFIX,discordapp.net,{{ rule }}
DOMAIN-SUFFIX,disqus.com,{{ rule }}
DOMAIN-SUFFIX,dlercloud.com,{{ rule }}
DOMAIN-SUFFIX,dns2go.com,{{ rule }}
DOMAIN-SUFFIX,dowjones.com,{{ rule }}
DOMAIN-SUFFIX,dropbox.com,{{ rule }}
DOMAIN-SUFFIX,dropboxusercontent.com,{{ rule }}
DOMAIN-SUFFIX,duckduckgo.com,{{ rule }}
DOMAIN-SUFFIX,dw.com,{{ rule }}
DOMAIN-SUFFIX,dynu.com,{{ rule }}
DOMAIN-SUFFIX,earthcam.com,{{ rule }}
DOMAIN-SUFFIX,ebookservice.tw,{{ rule }}
DOMAIN-SUFFIX,economist.com,{{ rule }}
DOMAIN-SUFFIX,edgecastcdn.net,{{ rule }}
DOMAIN-SUFFIX,edu,{{ rule }}
DOMAIN-SUFFIX,elpais.com,{{ rule }}
DOMAIN-SUFFIX,enanyang.my,{{ rule }}
DOMAIN-SUFFIX,encyclopedia.com,{{ rule }}
DOMAIN-SUFFIX,esoir.be,{{ rule }}
DOMAIN-SUFFIX,etherscan.io,{{ rule }}
DOMAIN-SUFFIX,euronews.com,{{ rule }}
DOMAIN-SUFFIX,evozi.com,{{ rule }}
DOMAIN-SUFFIX,feedly.com,{{ rule }}
DOMAIN-SUFFIX,firech.at,{{ rule }}
DOMAIN-SUFFIX,flickr.com,{{ rule }}
DOMAIN-SUFFIX,flitto.com,{{ rule }}
DOMAIN-SUFFIX,foreignpolicy.com,{{ rule }}
DOMAIN-SUFFIX,freebrowser.org,{{ rule }}
DOMAIN-SUFFIX,freewechat.com,{{ rule }}
DOMAIN-SUFFIX,freeweibo.com,{{ rule }}
DOMAIN-SUFFIX,friday.tw,{{ rule }}
DOMAIN-SUFFIX,ftchinese.com,{{ rule }}
DOMAIN-SUFFIX,ftimg.net,{{ rule }}
DOMAIN-SUFFIX,gate.io,{{ rule }}
DOMAIN-SUFFIX,getlantern.org,{{ rule }}
DOMAIN-SUFFIX,getsync.com,{{ rule }}
DOMAIN-SUFFIX,globalvoices.org,{{ rule }}
DOMAIN-SUFFIX,goo.ne.jp,{{ rule }}
DOMAIN-SUFFIX,goodreads.com,{{ rule }}
DOMAIN-SUFFIX,gov,{{ rule }}
DOMAIN-SUFFIX,gov.tw,{{ rule }}
DOMAIN-SUFFIX,greatfire.org,{{ rule }}
DOMAIN-SUFFIX,gumroad.com,{{ rule }}
DOMAIN-SUFFIX,hbg.com,{{ rule }}
DOMAIN-SUFFIX,heroku.com,{{ rule }}
DOMAIN-SUFFIX,hightail.com,{{ rule }}
DOMAIN-SUFFIX,hk01.com,{{ rule }}
DOMAIN-SUFFIX,hkbf.org,{{ rule }}
DOMAIN-SUFFIX,hkbookcity.com,{{ rule }}
DOMAIN-SUFFIX,hkej.com,{{ rule }}
DOMAIN-SUFFIX,hket.com,{{ rule }}
DOMAIN-SUFFIX,hkgolden.com,{{ rule }}
DOMAIN-SUFFIX,hootsuite.com,{{ rule }}
DOMAIN-SUFFIX,hudson.org,{{ rule }}
DOMAIN-SUFFIX,hyread.com.tw,{{ rule }}
DOMAIN-SUFFIX,ibtimes.com,{{ rule }}
DOMAIN-SUFFIX,i-cable.com,{{ rule }}
DOMAIN-SUFFIX,icij.org,{{ rule }}
DOMAIN-SUFFIX,icoco.com,{{ rule }}
DOMAIN-SUFFIX,imgur.com,{{ rule }}
DOMAIN-SUFFIX,initiummall.com,{{ rule }}
DOMAIN-SUFFIX,insecam.org,{{ rule }}
DOMAIN-SUFFIX,ipfs.io,{{ rule }}
DOMAIN-SUFFIX,issuu.com,{{ rule }}
DOMAIN-SUFFIX,istockphoto.com,{{ rule }}
DOMAIN-SUFFIX,japantimes.co.jp,{{ rule }}
DOMAIN-SUFFIX,jiji.com,{{ rule }}
DOMAIN-SUFFIX,jinx.com,{{ rule }}
DOMAIN-SUFFIX,jkforum.net,{{ rule }}
DOMAIN-SUFFIX,joinmastodon.org,{{ rule }}
DOMAIN-SUFFIX,justmysocks.net,{{ rule }}
DOMAIN-SUFFIX,justpaste.it,{{ rule }}
DOMAIN-SUFFIX,kakao.com,{{ rule }}
DOMAIN-SUFFIX,kakaocorp.com,{{ rule }}
DOMAIN-SUFFIX,kik.com,{{ rule }}
DOMAIN-SUFFIX,kobo.com,{{ rule }}
DOMAIN-SUFFIX,kobobooks.com,{{ rule }}
DOMAIN-SUFFIX,kodingen.com,{{ rule }}
DOMAIN-SUFFIX,lemonde.fr,{{ rule }}
DOMAIN-SUFFIX,lepoint.fr,{{ rule }}
DOMAIN-SUFFIX,lihkg.com,{{ rule }}
DOMAIN-SUFFIX,listennotes.com,{{ rule }}
DOMAIN-SUFFIX,livestream.com,{{ rule }}
DOMAIN-SUFFIX,logmein.com,{{ rule }}
DOMAIN-SUFFIX,mail.ru,{{ rule }}
DOMAIN-SUFFIX,mailchimp.com,{{ rule }}
DOMAIN-SUFFIX,marc.info,{{ rule }}
DOMAIN-SUFFIX,matters.news,{{ rule }}
DOMAIN-SUFFIX,maying.co,{{ rule }}
DOMAIN-SUFFIX,medium.com,{{ rule }}
DOMAIN-SUFFIX,mega.nz,{{ rule }}
DOMAIN-SUFFIX,mil,{{ rule }}
DOMAIN-SUFFIX,mingpao.com,{{ rule }}
DOMAIN-SUFFIX,mobile01.com,{{ rule }}
DOMAIN-SUFFIX,myspace.com,{{ rule }}
DOMAIN-SUFFIX,myspacecdn.com,{{ rule }}
DOMAIN-SUFFIX,nanyang.com,{{ rule }}
DOMAIN-SUFFIX,naver.com,{{ rule }}
DOMAIN-SUFFIX,neowin.net,{{ rule }}
DOMAIN-SUFFIX,newstapa.org,{{ rule }}
DOMAIN-SUFFIX,nexitally.com,{{ rule }}
DOMAIN-SUFFIX,nhk.or.jp,{{ rule }}
DOMAIN-SUFFIX,nicovideo.jp,{{ rule }}
DOMAIN-SUFFIX,nii.ac.jp,{{ rule }}
DOMAIN-SUFFIX,nikkei.com,{{ rule }}
DOMAIN-SUFFIX,nofile.io,{{ rule }}
DOMAIN-SUFFIX,now.com,{{ rule }}
DOMAIN-SUFFIX,nrk.no,{{ rule }}
DOMAIN-SUFFIX,nyt.com,{{ rule }}
DOMAIN-SUFFIX,nytchina.com,{{ rule }}
DOMAIN-SUFFIX,nytcn.me,{{ rule }}
DOMAIN-SUFFIX,nytco.com,{{ rule }}
DOMAIN-SUFFIX,nytimes.com,{{ rule }}
DOMAIN-SUFFIX,nytimg.com,{{ rule }}
DOMAIN-SUFFIX,nytlog.com,{{ rule }}
DOMAIN-SUFFIX,nytstyle.com,{{ rule }}
DOMAIN-SUFFIX,ok.ru,{{ rule }}
DOMAIN-SUFFIX,okex.com,{{ rule }}
DOMAIN-SUFFIX,on.cc,{{ rule }}
DOMAIN-SUFFIX,orientaldaily.com.my,{{ rule }}
DOMAIN-SUFFIX,overcast.fm,{{ rule }}
DOMAIN-SUFFIX,paltalk.com,{{ rule }}
DOMAIN-SUFFIX,pao-pao.net,{{ rule }}
DOMAIN-SUFFIX,parsevideo.com,{{ rule }}
DOMAIN-SUFFIX,pbxes.com,{{ rule }}
DOMAIN-SUFFIX,pcdvd.com.tw,{{ rule }}
DOMAIN-SUFFIX,pchome.com.tw,{{ rule }}
DOMAIN-SUFFIX,pcloud.com,{{ rule }}
DOMAIN-SUFFIX,picacomic.com,{{ rule }}
DOMAIN-SUFFIX,pinimg.com,{{ rule }}
DOMAIN-SUFFIX,pixiv.net,{{ rule }}
DOMAIN-SUFFIX,player.fm,{{ rule }}
DOMAIN-SUFFIX,plurk.com,{{ rule }}
DOMAIN-SUFFIX,po18.tw,{{ rule }}
DOMAIN-SUFFIX,potato.im,{{ rule }}
DOMAIN-SUFFIX,potatso.com,{{ rule }}
DOMAIN-SUFFIX,prism-break.org,{{ rule }}
DOMAIN-SUFFIX,proxifier.com,{{ rule }}
DOMAIN-SUFFIX,pt.im,{{ rule }}
DOMAIN-SUFFIX,pts.org.tw,{{ rule }}
DOMAIN-SUFFIX,pubu.com.tw,{{ rule }}
DOMAIN-SUFFIX,pubu.tw,{{ rule }}
DOMAIN-SUFFIX,pureapk.com,{{ rule }}
DOMAIN-SUFFIX,quora.com,{{ rule }}
DOMAIN-SUFFIX,quoracdn.net,{{ rule }}
DOMAIN-SUFFIX,rakuten.co.jp,{{ rule }}
DOMAIN-SUFFIX,readingtimes.com.tw,{{ rule }}
DOMAIN-SUFFIX,readmoo.com,{{ rule }}
DOMAIN-SUFFIX,redbubble.com,{{ rule }}
DOMAIN-SUFFIX,reddit.com,{{ rule }}
DOMAIN-SUFFIX,redditmedia.com,{{ rule }}
DOMAIN-SUFFIX,resilio.com,{{ rule }}
DOMAIN-SUFFIX,reuters.com,{{ rule }}
DOMAIN-SUFFIX,reutersmedia.net,{{ rule }}
DOMAIN-SUFFIX,rfi.fr,{{ rule }}
DOMAIN-SUFFIX,rixcloud.com,{{ rule }}
DOMAIN-SUFFIX,roadshow.hk,{{ rule }}
DOMAIN-SUFFIX,scmp.com,{{ rule }}
DOMAIN-SUFFIX,scribd.com,{{ rule }}
DOMAIN-SUFFIX,seatguru.com,{{ rule }}
DOMAIN-SUFFIX,shadowsocks.org,{{ rule }}
DOMAIN-SUFFIX,shopee.tw,{{ rule }}
DOMAIN-SUFFIX,slideshare.net,{{ rule }}
DOMAIN-SUFFIX,softfamous.com,{{ rule }}
DOMAIN-SUFFIX,soundcloud.com,{{ rule }}
DOMAIN-SUFFIX,ssrcloud.org,{{ rule }}
DOMAIN-SUFFIX,startpage.com,{{ rule }}
DOMAIN-SUFFIX,steamcommunity.com,{{ rule }}
DOMAIN-SUFFIX,steemit.com,{{ rule }}
DOMAIN-SUFFIX,steemitwallet.com,{{ rule }}
DOMAIN-SUFFIX,t66y.com,{{ rule }}
DOMAIN-SUFFIX,tapatalk.com,{{ rule }}
DOMAIN-SUFFIX,teco-hk.org,{{ rule }}
DOMAIN-SUFFIX,teco-mo.org,{{ rule }}
DOMAIN-SUFFIX,teddysun.com,{{ rule }}
DOMAIN-SUFFIX,textnow.me,{{ rule }}
DOMAIN-SUFFIX,theguardian.com,{{ rule }}
DOMAIN-SUFFIX,theinitium.com,{{ rule }}
DOMAIN-SUFFIX,thetvdb.com,{{ rule }}
DOMAIN-SUFFIX,tineye.com,{{ rule }}
DOMAIN-SUFFIX,torproject.org,{{ rule }}
DOMAIN-SUFFIX,tumblr.com,{{ rule }}
DOMAIN-SUFFIX,turbobit.net,{{ rule }}
DOMAIN-SUFFIX,tutanota.com,{{ rule }}
DOMAIN-SUFFIX,tvboxnow.com,{{ rule }}
DOMAIN-SUFFIX,udn.com,{{ rule }}
DOMAIN-SUFFIX,unseen.is,{{ rule }}
DOMAIN-SUFFIX,upmedia.mg,{{ rule }}
DOMAIN-SUFFIX,uptodown.com,{{ rule }}
DOMAIN-SUFFIX,urbandictionary.com,{{ rule }}
DOMAIN-SUFFIX,ustream.tv,{{ rule }}
DOMAIN-SUFFIX,uwants.com,{{ rule }}
DOMAIN-SUFFIX,v2ray.com,{{ rule }}
DOMAIN-SUFFIX,viber.com,{{ rule }}
DOMAIN-SUFFIX,videopress.com,{{ rule }}
DOMAIN-SUFFIX,vimeo.com,{{ rule }}
DOMAIN-SUFFIX,voachinese.com,{{ rule }}
DOMAIN-SUFFIX,voanews.com,{{ rule }}
DOMAIN-SUFFIX,voxer.com,{{ rule }}
DOMAIN-SUFFIX,vzw.com,{{ rule }}
DOMAIN-SUFFIX,w3schools.com,{{ rule }}
DOMAIN-SUFFIX,washingtonpost.com,{{ rule }}
DOMAIN-SUFFIX,wattpad.com,{{ rule }}
DOMAIN-SUFFIX,whoer.net,{{ rule }}
DOMAIN-SUFFIX,wikimapia.org,{{ rule }}
DOMAIN-SUFFIX,wikipedia.org,{{ rule }}
DOMAIN-SUFFIX,wikiquote.org,{{ rule }}
DOMAIN-SUFFIX,wikiwand.com,{{ rule }}
DOMAIN-SUFFIX,winudf.com,{{ rule }}
DOMAIN-SUFFIX,wire.com,{{ rule }}
DOMAIN-SUFFIX,wordpress.com,{{ rule }}
DOMAIN-SUFFIX,workflow.is,{{ rule }}
DOMAIN-SUFFIX,worldcat.org,{{ rule }}
DOMAIN-SUFFIX,wsj.com,{{ rule }}
DOMAIN-SUFFIX,wsj.net,{{ rule }}
DOMAIN-SUFFIX,xhamster.com,{{ rule }}
DOMAIN-SUFFIX,xn--90wwvt03e.com,{{ rule }}
DOMAIN-SUFFIX,xn--i2ru8q2qg.com,{{ rule }}
DOMAIN-SUFFIX,xnxx.com,{{ rule }}
DOMAIN-SUFFIX,xvideos.com,{{ rule }}
DOMAIN-SUFFIX,yahoo.com,{{ rule }}
DOMAIN-SUFFIX,yandex.ru,{{ rule }}
DOMAIN-SUFFIX,ycombinator.com,{{ rule }}
DOMAIN-SUFFIX,yesasia.com,{{ rule }}
DOMAIN-SUFFIX,yes-news.com,{{ rule }}
DOMAIN-SUFFIX,yomiuri.co.jp,{{ rule }}
DOMAIN-SUFFIX,you-get.org,{{ rule }}
DOMAIN-SUFFIX,zaobao.com,{{ rule }}
DOMAIN-SUFFIX,zb.com,{{ rule }}
DOMAIN-SUFFIX,zello.com,{{ rule }}
DOMAIN-SUFFIX,zeronet.io,{{ rule }}
DOMAIN-SUFFIX,zoom.us,{{ rule }}
DOMAIN-KEYWORD,github,{{ rule }}
DOMAIN-KEYWORD,jav,{{ rule }}
DOMAIN-KEYWORD,pinterest,{{ rule }}
DOMAIN-KEYWORD,porn,{{ rule }}
DOMAIN-KEYWORD,wikileaks,{{ rule }}

# (Region-Restricted Access Denied)
DOMAIN-SUFFIX,apartmentratings.com,{{ rule }}
DOMAIN-SUFFIX,apartments.com,{{ rule }}
DOMAIN-SUFFIX,bankmobilevibe.com,{{ rule }}
DOMAIN-SUFFIX,bing.com,{{ rule }}
DOMAIN-SUFFIX,booktopia.com.au,{{ rule }}
DOMAIN-SUFFIX,cccat.io,{{ rule }}
DOMAIN-SUFFIX,centauro.com.br,{{ rule }}
DOMAIN-SUFFIX,clearsurance.com,{{ rule }}
DOMAIN-SUFFIX,costco.com,{{ rule }}
DOMAIN-SUFFIX,crackle.com,{{ rule }}
DOMAIN-SUFFIX,depositphotos.cn,{{ rule }}
DOMAIN-SUFFIX,dish.com,{{ rule }}
DOMAIN-SUFFIX,dmm.co.jp,{{ rule }}
DOMAIN-SUFFIX,dmm.com,{{ rule }}
DOMAIN-SUFFIX,dnvod.tv,{{ rule }}
DOMAIN-SUFFIX,esurance.com,{{ rule }}
DOMAIN-SUFFIX,extmatrix.com,{{ rule }}
DOMAIN-SUFFIX,fastpic.ru,{{ rule }}
DOMAIN-SUFFIX,flipboard.com,{{ rule }}
DOMAIN-SUFFIX,fnac.be,{{ rule }}
DOMAIN-SUFFIX,fnac.com,{{ rule }}
DOMAIN-SUFFIX,funkyimg.com,{{ rule }}
DOMAIN-SUFFIX,fxnetworks.com,{{ rule }}
DOMAIN-SUFFIX,gettyimages.com,{{ rule }}
DOMAIN-SUFFIX,go.com,{{ rule }}
DOMAIN-SUFFIX,here.com,{{ rule }}
DOMAIN-SUFFIX,jcpenney.com,{{ rule }}
DOMAIN-SUFFIX,jiehua.tv,{{ rule }}
DOMAIN-SUFFIX,mailfence.com,{{ rule }}
DOMAIN-SUFFIX,nationwide.com,{{ rule }}
DOMAIN-SUFFIX,nbc.com,{{ rule }}
DOMAIN-SUFFIX,nexon.com,{{ rule }}
DOMAIN-SUFFIX,nordstrom.com,{{ rule }}
DOMAIN-SUFFIX,nordstromimage.com,{{ rule }}
DOMAIN-SUFFIX,nordstromrack.com,{{ rule }}
DOMAIN-SUFFIX,superpages.com,{{ rule }}
DOMAIN-SUFFIX,target.com,{{ rule }}
DOMAIN-SUFFIX,thinkgeek.com,{{ rule }}
DOMAIN-SUFFIX,tracfone.com,{{ rule }}
DOMAIN-SUFFIX,unity3d.com,{{ rule }}
DOMAIN-SUFFIX,uploader.jp,{{ rule }}
DOMAIN-SUFFIX,vevo.com,{{ rule }}
DOMAIN-SUFFIX,viu.tv,{{ rule }}
DOMAIN-SUFFIX,vk.com,{{ rule }}
DOMAIN-SUFFIX,vsco.co,{{ rule }}
DOMAIN-SUFFIX,xfinity.com,{{ rule }}
DOMAIN-SUFFIX,zattoo.com,{{ rule }}
USER-AGENT,Roam*,{{ rule }}

# (The Most Popular Sites)
# > Apple
# >> TestFlight
DOMAIN,testflight.apple.com,{{ rule }}
# >> Apple URL Shortener
DOMAIN-SUFFIX,appsto.re,{{ rule }}
# >> iBooks Store download
DOMAIN,books.itunes.apple.com,{{ rule }}
# >> iTunes Store Moveis Trailers
DOMAIN,hls.itunes.apple.com,{{ rule }}
# >> App Store Preview
DOMAIN,apps.apple.com,{{ rule }}
DOMAIN,itunes.apple.com,{{ rule }}
# >> Spotlight
DOMAIN,api-glb-sea.smoot.apple.com,{{ rule }}
# >> Dictionary
DOMAIN,lookup-api.apple.com,{{ rule }}
PROCESS-NAME,LookupViewService,{{ rule }}
# > Google
DOMAIN-SUFFIX,abc.xyz,{{ rule }}
DOMAIN-SUFFIX,android.com,{{ rule }}
DOMAIN-SUFFIX,androidify.com,{{ rule }}
DOMAIN-SUFFIX,dialogflow.com,{{ rule }}
DOMAIN-SUFFIX,autodraw.com,{{ rule }}
DOMAIN-SUFFIX,capitalg.com,{{ rule }}
DOMAIN-SUFFIX,certificate-transparency.org,{{ rule }}
DOMAIN-SUFFIX,chrome.com,{{ rule }}
DOMAIN-SUFFIX,chromeexperiments.com,{{ rule }}
DOMAIN-SUFFIX,chromestatus.com,{{ rule }}
DOMAIN-SUFFIX,chromium.org,{{ rule }}
DOMAIN-SUFFIX,creativelab5.com,{{ rule }}
DOMAIN-SUFFIX,debug.com,{{ rule }}
DOMAIN-SUFFIX,deepmind.com,{{ rule }}
DOMAIN-SUFFIX,firebaseio.com,{{ rule }}
DOMAIN-SUFFIX,getmdl.io,{{ rule }}
DOMAIN-SUFFIX,ggpht.com,{{ rule }}
DOMAIN-SUFFIX,gmail.com,{{ rule }}
DOMAIN-SUFFIX,gmodules.com,{{ rule }}
DOMAIN-SUFFIX,godoc.org,{{ rule }}
DOMAIN-SUFFIX,golang.org,{{ rule }}
DOMAIN-SUFFIX,gstatic.com,{{ rule }}
DOMAIN-SUFFIX,gv.com,{{ rule }}
DOMAIN-SUFFIX,gwtproject.org,{{ rule }}
DOMAIN-SUFFIX,itasoftware.com,{{ rule }}
DOMAIN-SUFFIX,madewithcode.com,{{ rule }}
DOMAIN-SUFFIX,material.io,{{ rule }}
DOMAIN-SUFFIX,polymer-project.org,{{ rule }}
DOMAIN-SUFFIX,admin.recaptcha.net,{{ rule }}
DOMAIN-SUFFIX,recaptcha.net,{{ rule }}
DOMAIN-SUFFIX,shattered.io,{{ rule }}
DOMAIN-SUFFIX,synergyse.com,{{ rule }}
DOMAIN-SUFFIX,tensorflow.org,{{ rule }}
DOMAIN-SUFFIX,tfhub.dev,{{ rule }}
DOMAIN-SUFFIX,tiltbrush.com,{{ rule }}
DOMAIN-SUFFIX,waveprotocol.org,{{ rule }}
DOMAIN-SUFFIX,waymo.com,{{ rule }}
DOMAIN-SUFFIX,webmproject.org,{{ rule }}
DOMAIN-SUFFIX,webrtc.org,{{ rule }}
DOMAIN-SUFFIX,whatbrowser.org,{{ rule }}
DOMAIN-SUFFIX,widevine.com,{{ rule }}
DOMAIN-SUFFIX,x.company,{{ rule }}
DOMAIN-SUFFIX,youtu.be,{{ rule }}
DOMAIN-SUFFIX,yt.be,{{ rule }}
DOMAIN-SUFFIX,ytimg.com,{{ rule }}
# > Microsoft
# >> Microsoft OneDrive
DOMAIN-SUFFIX,1drv.com,{{ rule }}
DOMAIN-SUFFIX,1drv.ms,{{ rule }}
DOMAIN-SUFFIX,blob.core.windows.net,{{ rule }}
DOMAIN-SUFFIX,livefilestore.com,{{ rule }}
DOMAIN-SUFFIX,onedrive.com,{{ rule }}
DOMAIN-SUFFIX,storage.live.com,{{ rule }}
DOMAIN-SUFFIX,storage.msn.com,{{ rule }}
DOMAIN,oneclient.sfx.ms,{{ rule }}
# > Other
DOMAIN-SUFFIX,0rz.tw,{{ rule }}
DOMAIN-SUFFIX,4bluestones.biz,{{ rule }}
DOMAIN-SUFFIX,9bis.net,{{ rule }}
DOMAIN-SUFFIX,allconnected.co,{{ rule }}
DOMAIN-SUFFIX,aol.com,{{ rule }}
DOMAIN-SUFFIX,bcc.com.tw,{{ rule }}
DOMAIN-SUFFIX,bit.ly,{{ rule }}
DOMAIN-SUFFIX,bitshare.com,{{ rule }}
DOMAIN-SUFFIX,blog.jp,{{ rule }}
DOMAIN-SUFFIX,blogimg.jp,{{ rule }}
DOMAIN-SUFFIX,blogtd.org,{{ rule }}
DOMAIN-SUFFIX,broadcast.co.nz,{{ rule }}
DOMAIN-SUFFIX,camfrog.com,{{ rule }}
DOMAIN-SUFFIX,cfos.de,{{ rule }}
DOMAIN-SUFFIX,citypopulation.de,{{ rule }}
DOMAIN-SUFFIX,cloudfront.net,{{ rule }}
DOMAIN-SUFFIX,ctitv.com.tw,{{ rule }}
DOMAIN-SUFFIX,cuhk.edu.hk,{{ rule }}
DOMAIN-SUFFIX,cusu.hk,{{ rule }}
DOMAIN-SUFFIX,discord.gg,{{ rule }}
DOMAIN-SUFFIX,discuss.com.hk,{{ rule }}
DOMAIN-SUFFIX,dropboxapi.com,{{ rule }}
DOMAIN-SUFFIX,duolingo.cn,{{ rule }}
DOMAIN-SUFFIX,edditstatic.com,{{ rule }}
DOMAIN-SUFFIX,flickriver.com,{{ rule }}
DOMAIN-SUFFIX,focustaiwan.tw,{{ rule }}
DOMAIN-SUFFIX,free.fr,{{ rule }}
DOMAIN-SUFFIX,gigacircle.com,{{ rule }}
DOMAIN-SUFFIX,hk-pub.com,{{ rule }}
DOMAIN-SUFFIX,hosting.co.uk,{{ rule }}
DOMAIN-SUFFIX,hwcdn.net,{{ rule }}
DOMAIN-SUFFIX,ifixit.com,{{ rule }}
DOMAIN-SUFFIX,iphone4hongkong.com,{{ rule }}
DOMAIN-SUFFIX,iphonetaiwan.org,{{ rule }}
DOMAIN-SUFFIX,iptvbin.com,{{ rule }}
DOMAIN-SUFFIX,linksalpha.com,{{ rule }}
DOMAIN-SUFFIX,manyvids.com,{{ rule }}
DOMAIN-SUFFIX,myactimes.com,{{ rule }}
DOMAIN-SUFFIX,newsblur.com,{{ rule }}
DOMAIN-SUFFIX,now.im,{{ rule }}
DOMAIN-SUFFIX,nowe.com,{{ rule }}
DOMAIN-SUFFIX,redditlist.com,{{ rule }}
DOMAIN-SUFFIX,s3.amazonaws.com,{{ rule }}
DOMAIN-SUFFIX,signal.org,{{ rule }}
DOMAIN-SUFFIX,smartmailcloud.com,{{ rule }}
DOMAIN-SUFFIX,sparknotes.com,{{ rule }}
DOMAIN-SUFFIX,streetvoice.com,{{ rule }}
DOMAIN-SUFFIX,supertop.co,{{ rule }}
DOMAIN-SUFFIX,tv.com,{{ rule }}
DOMAIN-SUFFIX,typepad.com,{{ rule }}
DOMAIN-SUFFIX,udnbkk.com,{{ rule }}
DOMAIN-SUFFIX,urbanairship.com,{{ rule }}
DOMAIN-SUFFIX,whispersystems.org,{{ rule }}
DOMAIN-SUFFIX,wikia.com,{{ rule }}
DOMAIN-SUFFIX,wn.com,{{ rule }}
DOMAIN-SUFFIX,wolframalpha.com,{{ rule }}
DOMAIN-SUFFIX,x-art.com,{{ rule }}
DOMAIN-SUFFIX,yimg.com,{{ rule }}
DOMAIN,api.steampowered.com,{{ rule }}
DOMAIN,store.steampowered.com,{{ rule }}
{% endmacro %}