{% macro main(rule) %}
# > HBO NOW
USER-AGENT,HBO%20NOW*,{{ rule }}
DOMAIN-SUFFIX,hbo.com,{{ rule }}
DOMAIN-SUFFIX,hbogo.com,{{ rule }}
DOMAIN-SUFFIX,hbonow.com,{{ rule }}
{% endmacro %}