#!/bin/bash

#export LIBPROCESS_PORT="4401"
chronos_options=(cassandra_contact_points disable_after_failures failover_timeout graphite_host_port hostname job_history_limit leader_max_idle_time mail_server raven_dsn slack_url task_epsilon user zk_hosts cassandra_consistency cassandra_keyspace cassandra_password cassandra_port cassandra_stat_count_table cassandra_table cassandra_ttl cassandra_user cluster_name decline_offer_duration disable_http failure_retry graphite_group_prefix graphite_reporting_interval http_address http_compression disable_http_compression http_credentials http_notification_credentials http_notification_url http_port http_realm https_address https_port mail_from mail_password mail_ssl mail_user master mattermost_url mesos_authentication_principal mesos_authentication_secret_file mesos_checkpoint mesos_framework_name mesos_role mesos_task_cpu mesos_task_disk mesos_task_mem min_revive_offers_interval reconciliation_interval revive_offers_for_new_jobs ssl_keystore_password ssl_keystore_path ssl_keystore_password webui_url zk_auth zk_path zk_timeout)
CHRONOS_OPTS=""
CHRONOS_CONF=/etc/chronos/conf
if [[ -d "${CHRONOS_CONF}" ]]
then
  for option in `ls ${CHRONOS_CONF}`;
  do
    if [[ " ${chronos_options[*]} " == *"$option"* ]];
    then
      option_value=`cat ${CHRONOS_CONF}/${option}`
      CHRONOS_OPTS="${CHRONOS_OPTS} --${option} ${option_value}"
    fi
  done
fi
#echo $CHRONOS_OPTS
exec java $JVM_OPTS -jar /chronos/chronos-3.0.3-SNAPSHOT.jar $@ $CHRONOS_OPTS
