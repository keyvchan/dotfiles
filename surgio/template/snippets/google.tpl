{% macro main(rule) %}
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
# (DNS Cache Pollution Protection)
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
{% endmacro %}