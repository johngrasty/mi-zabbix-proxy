#!/bin/bash

ZABBIX_AGENT_CONFD='/opt/zabbix/etc/zabbix_agentd.conf.d'
ZABBIX_AGENT_CONF='/opt/zabbix/etc/zabbix_agentd.conf'

if mdata-get zabbix_server 1>/dev/null 2>&1; then
	

	echo "Server=localhost" > ${ZABBIX_AGENT_CONFD}/server.conf
	echo "ActiveServer=localhost" >> ${ZABBIX_AGENT_CONFD}/server.conf
	
	mv /opt/core/var/zabbix/zabbix-proxy.conf ${ZABBIX_PROXY_CONF}
	
	svcadm enable zabbix-agent
	
fi