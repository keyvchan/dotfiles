{% macro main(rule) %}
DOMAIN-SUFFIX,hulu.com, {{ rule }}
DOMAIN-SUFFIX,huluim.com, {{ rule }}
DOMAIN-SUFFIX,hulustream.com, {{ rule }}
{% endmacro %}