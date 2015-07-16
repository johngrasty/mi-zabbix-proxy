#!/bin/bash

ZABBIX_PROXY_CONFD='/opt/zabbix/etc/zabbix_proxy.conf.d'
ZABBIX_PROXY_CONF='/opt/zabbix/etc/zabbix_proxy.conf'

if mdata-get zabbix_server 1>/dev/null 2>&1; then
	

	echo "Server=$(mdata-get zabbix_server)" > ${ZABBIX_PROXY_CONFD}/server.conf
	
	cp /opt/core/var/zabbix/proxy.conf ${ZABBIX_PROXY_CONFD}/
	mv /opt/core/var/zabbix/zabbix-proxy.con ${ZABBIX_PROXY_CONF}
	
	svcadm enable zabbix-proxy
	
fi