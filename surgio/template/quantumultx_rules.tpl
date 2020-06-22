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

{{ custom.main('proxy', '🏹 Direct') | quantumultx }}

{{ apple.main('proxy', '🍎 Apple', '🍎 Apple CDN', '🏹 Direct', '🇺🇸 US') | quantumultx }}

{{ remoteSnippets.Hulu.main('🎬 Netflix') | quantumultx }}

{{ remoteSnippets.Netflix.main('🎬 Netflix') | quantumultx }}

{{ remoteSnippets.Spotify.main('🎵 Spotify') | quantumultx }}

{{ remoteSnippets.OneDrive.main('☁️ OneDrive') | quantumultx }}

{{ remoteSnippets.Pornhub.main('🔞 Pornhub') | quantumultx }}

{{ microsoft.main('🖥 Microsoft') | quantumultx }}

{{ remoteSnippets.Telegram.main('📞 Telegram') | quantumultx }}

{{ remoteSnippets.YouTube.main('📺 YouTube') | quantumultx }}

{{ remoteSnippets.Google.main('🌊 Google') | quantumultx }}

{{ remoteSnippets.Global.main('🌏 Global') | quantumultx }}

{{ direct.main('🏹 Direct') | quantumultx }}


{# {{ netflix.main('🎬 Netflix') | quantumultx }}

{{ microsoft.main('🖥 Microsoft') | quantumultx }}

{{ OneDrive.main('☁️ OneDrive') | quantumultx }}

{{ telegram.main('📞 Telegram') | quantumultx }}

{{ youtube.main('📺 YouTube') | quantumultx }}

{{ google.main('🌊 Google') | quantumultx }}

{{ global.main('🌏 Global') | quantumultx }}

{{ direct.main('🏹 Direct') | quantumultx }} #}