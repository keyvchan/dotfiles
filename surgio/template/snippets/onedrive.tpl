{% macro main(rule) %}
# > OneDrive
PROCESS-NAME,OneDrive,{{ rule }}
PROCESS-NAME,OneDriveUpdater,{{ rule }}
USER-AGENT,OneDrive*,{{ rule }}
USER-AGENT,OneDriveiOSApp*,{{ rule }}
{% endmacro %}