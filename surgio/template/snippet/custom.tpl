{% macro main(proxy, direct) %}
# Asphalt 9 
PROCESS-NAME,Asphalt9,{{ proxy }}
PROCESS-NAME,Asphalt 9,{{ proxy }}
DOMAIN-SUFFIX,gameloft.com,{{ proxy }}

# Windows Update
DOMAIN, delivery.mp.microsoft.com, {{ direct }}

{# # Android push notification
DOMAIN, mtalk.google.com, {{ direct }} #}

{% endmacro %}
