{% macro main(rule) %}
# YouTube
DOMAIN,youtubei.googleapis.com,{{ rule }}
DOMAIN-SUFFIX,youtube.com,{{ rule }}
DOMAIN-SUFFIX,googlevideo.com,{{ rule }}
DOMAIN-SUFFIX,youtube-nocookie.com,{{ rule }}
DOMAIN-SUFFIX,youtu.be,{{ rule }}
DOMAIN-SUFFIX,youtu.be,{{ rule }}
DOMAIN-SUFFIX,yt.be,{{ rule }}
DOMAIN-SUFFIX,ytimg.com,{{ rule }}
DOMAIN-SUFFIX,ggpht.com,{{ rule }}
DOMAIN-SUFFIX,gvt2.com, {{ rule }}
USER-AGENT,*YouTube*,{{ rule }}
USER-AGENT,com.google.ios.youtube*,{{ rule }}

# Youtube Music
USER-AGENT,YouTubeMusic*,{{ rule }}
USER-AGENT,com.google.ios.youtubemusic*,{{ rule }}
DOMAIN-SUFFIX,music.youtube.com,{{ rule }}
{% endmacro %}
