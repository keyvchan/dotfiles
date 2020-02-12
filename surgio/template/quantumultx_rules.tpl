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

{{ custom.main('proxy') | quantumultx }}

{{ apple.main('proxy', '🍎 Apple', '🍎 Apple CDN', 'DIRECT', '🇺🇸 US') | quantumultx }}

{{ microsoft.main('🖥 Microsoft') | quantumultx }}

{{ OneDrive.main('☁️ OneDrive') | quantumultx }}

{{ telegram.main('proxy') | quantumultx }}

{{ youtube.main('📺 YouTube') | quantumultx }}

{{ google.main('🇭🇰 HK') | quantumultx }}

{{ global.main('🌏 Global') | quantumultx }}

{{ direct.main('🏹 Direct') | quantumultx }}