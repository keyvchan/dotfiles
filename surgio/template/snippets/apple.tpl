{% macro main(Default, api_rule, cdn_rule, direct, apple_news_rule) %}
# http://www.jjinc.com.au/announcements/apple170008services
#
# Apple 直连
#
USER-AGENT,*com.apple.mobileme.fmip1,{{ direct }}
USER-AGENT,*WeatherFoundation*,{{ direct }}
# Maps
USER-AGENT,%E5%9C%B0%E5%9B%BE*,{{ direct }}
# Settings
USER-AGENT,%E8%AE%BE%E7%BD%AE*,{{ direct}}
USER-AGENT,com.apple.geod*,{{ direct }}
USER-AGENT,com.apple.Maps,{{ direct }}
USER-AGENT,FindMyFriends*,{{ direct}}
USER-AGENT,FindMyiPhone*,{{ direct}}
USER-AGENT,FMDClient*,{{ direct}}
USER-AGENT,FMFD*,{{ direct}}
USER-AGENT,fmflocatord*,{{ direct}}
USER-AGENT,geod*,{{ direct }}
USER-AGENT,locationd*,{{ direct }}
USER-AGENT,Maps*,{{ direct }}

#
# 一些 com.apple.appstored* 会连接的 API（优先级高）
#
DOMAIN,apps.apple.com,{{ api_rule }}
DOMAIN,xp.apple.com,{{ api_rule }}
DOMAIN,bag.itunes.apple.com,{{ api_rule }}
DOMAIN,api-edge.apps.apple.com,{{ api_rule }}
DOMAIN,api.apps.apple.com,{{ api_rule }}
DOMAIN,play.itunes.apple.com,{{ api_rule }}
DOMAIN,se.itunes.apple.com,{{ api_rule }}
DOMAIN,se-edge.itunes.apple.com,{{ api_rule }}
DOMAIN,su.itunes.apple.com,{{ api_rule }}
DOMAIN,upp.itunes.apple.com,{{ api_rule }}
DOMAIN,beta.music.apple.com,{{ api_rule }}
DOMAIN-KEYWORD,buy.itunes.apple.com,{{ api_rule }}

#
# Apple Global CDN
#
# iOS App Store
DOMAIN,iosapps.itunes.apple.com,{{ cdn_rule }}
# Mac App Store
DOMAIN,osxapps.itunes.apple.com,{{ cdn_rule }}
# Update
DOMAIN,supportdownload.apple.com,{{ cdn_rule }}
# Update
DOMAIN,appldnld.apple.com,{{ cdn_rule }}
# Update
DOMAIN,swcdn.apple.com,{{ cdn_rule }}
DOMAIN,apptrailers.itunes.apple.com,{{ cdn_rule }}
DOMAIN,updates-http.cdn-apple.com,{{ cdn_rule }}
# App Store & iTunes Images
DOMAIN-SUFFIX,mzstatic.com,{{ cdn_rule }}
# Mac App Store
PROCESS-NAME,storedownloadd,{{ cdn_rule }}
# iOS App Store
USER-AGENT,com.apple.appstored*,{{ cdn_rule }}

#
# Apple Non-China CDN
#
# Trailer
DOMAIN-SUFFIX,hls.itunes.apple.com,{{ Default }}
# Movie Stream
DOMAIN-SUFFIX,hls-amt.itunes.apple.com,{{ Default }}
# iTunes Music Stream
DOMAIN-SUFFIX,audio-ssl.itunes.apple.com,{{ Default }}
DOMAIN-SUFFIX,cdn-apple.com,{{ Default }}
DOMAIN,cdn.apple-cloudkit.com,{{ Default }}
# Developer
DOMAIN,devimages-cdn.apple.com,{{ Default }}
# Developer
DOMAIN,devstreaming-cdn.apple.com,{{ Default }}
DOMAIN,js-cdn.music.apple.com,{{ Default }}

#
# Apple News
#
USER-AGENT,AppleNews*,{{apple_news_rule}}
DOMAIN-SUFFIX,apple.news,{{apple_news_rule}}
DOMAIN,news-events.apple.com,{{apple_news_rule}}
DOMAIN,news-edge.apple.com,{{apple_news_rule}}
DOMAIN,apple.comscoreresearch.com,{{apple_news_rule}}

#
# Apple 其他直连
#
DOMAIN,api.smoot.apple.com,{{ api_rule }}
DOMAIN,captive.apple.com, {{ api_rule }}
DOMAIN,configuration.apple.com,{{ api_rule }}
DOMAIN,guzzoni.apple.com,{{ api_rule }}
# Apple Pay
DOMAIN,smp-device-content.apple.com,{{ direct}}
# Apple Music Streaming
DOMAIN,aod.itunes.apple.com,{{ api_rule}}
DOMAIN,api.smoot.apple.cn,{{ api_rule}}
# locationd
DOMAIN,gs-loc.apple.com,{{ direct }}
# Apple Music Streaming
DOMAIN,mvod.itunes.apple.com,{{ api_rule }}
# Apple Music Streaming
DOMAIN,streamingaudio.itunes.apple.com,{{ api_rule }}
# Reserve
DOMAIN,reserve-prime.apple.com,{{ direct}}
DOMAIN-SUFFIX,ess.apple.com,{{ direct}}
DOMAIN-SUFFIX,push-apple.com.akadns.net,{{ direct}}
DOMAIN-SUFFIX,push.apple.com,{{ direct}}
# Apple Music
DOMAIN-SUFFIX,music.apple.com,{{ api_rule }}
# GeoServices.framework
DOMAIN-SUFFIX,ls.apple.com,{{ direct }}
# Asset Cache Locator Service
DOMAIN-SUFFIX,lcdn-locator.apple.com,{{ api_rule }}
# Caching Server Registration
DOMAIN-SUFFIX,lcdn-registration.apple.com,{{ api_rule }}
# Apple Pay
DOMAIN-KEYWORD,smp-device,{{ direct}}
# Apple Pay
USER-AGENT,passd*,{{ direct}}
# Apple Pay
USER-AGENT,Wallet*,{{ direct}}

#
# Apple 其他自选
#
DOMAIN-SUFFIX,aaplimg.com,{{ api_rule }}
DOMAIN-SUFFIX,apple.co,{{ api_rule }}
DOMAIN-SUFFIX,itunes.com,{{ api_rule }}
DOMAIN-SUFFIX,itunes.apple.com,{{ api_rule }}
# iCloud 上传和下载
DOMAIN-SUFFIX,icloud-content.com,{{ api_rule }}
DOMAIN-SUFFIX,me.com,{{ api_rule }}
DOMAIN-SUFFIX,apple.com,{{ api_rule }}
DOMAIN-SUFFIX,icloud.com,{{ api_rule }}
DOMAIN-SUFFIX,apple-cloudkit.com,{{ api_rule }}
{% endmacro %}
