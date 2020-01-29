{% macro main(rule) %}
# Microsoft
DOMAIN-SUFFIX,microsoft.com,{{ rule }}
DOMAIN-SUFFIX,msecnd.net,{{ rule }}
DOMAIN-SUFFIX,office365.com,{{ rule }}
DOMAIN-SUFFIX,outlook.com,{{ rule }}
DOMAIN-SUFFIX,s-microsoft.com,{{ rule }}
DOMAIN-SUFFIX,visualstudio.com,{{ rule }}
DOMAIN-SUFFIX,windows.com,{{ rule }}
DOMAIN-SUFFIX,windowsupdate.com,{{ rule }}
DOMAIN,officecdn-microsoft-com.akamaized.net,{{ rule }}
DOMAIN-SUFFIX,xboxlive.com,{{ rule }}

{% endmacro %}