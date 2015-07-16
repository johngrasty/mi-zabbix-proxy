log "Checking salt plans from mdata"

SALT_INSTALL=${SALT_INSTALL:-$(mdata-get salt_install 2>/dev/null)} || \
SALT_INSTALL="true";

if [[ ${SALT_INSTALL} == "true" ]]; then

	wget http://ggi-uploads.s3.amazonaws.com/salt/bootstrap-salt.sh || return 1
	
	sudo sh bootstrap-salt.sh -P git v2015.5.3 -A "$(mdata-get salt_master)" -i "$(mdata-get salt_id)"
	
	/usr/sbin/svcadm enable salt-minion

	sleep 5 

	salt-call state.highstate

fi