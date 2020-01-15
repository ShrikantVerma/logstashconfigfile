#!/bin/sh
logstash_FTA_IMS=$(ps -ef | grep -v grep | grep "/home/inf_user/logstash_FTA_IMS/logstash" | wc -l);
export https_proxy=http://airtelproxy.airtel.com:4145
export http_proxy=http://airtelproxy.airtel.com:4145
echo "out of if"
if [ $logstash_FTA_IMS == '0' ];
        then
	echo "in if"
                curl -i -k -X POST https://api.telegram.org/bot872159362:AAGdrD-OpcX3b1BRa6iKD2NxEIaKAXbQi68/sendMessage --data "chat_id=-267279142&text=10.14.162.49 logstash_FTA_IMS is dead"
                                sleep 5s
                              cd /home/inf_user/logstash_FTA_IMS/ && nohup bin/logstash -f &
			#	/bin/nohup /home/inf_user/logstash_FTA_IMS/logstash/bin/logstash &
                                        logstash_FTA_IMS=$(ps -ef | grep -v grep | grep "/home/inf_user/logstash_FTA_IMS/logstash" | wc -l);
                                                if [ $logstash_FTA_IMS == '1' ];
                                                        then
                                                        curl -i -k -X POST https://api.telegram.org/bot872159362:AAGdrD-OpcX3b1BRa6iKD2NxEIaKAXbQi68/sendMessage --data "chat_id=-267279142&text=10.14.162.59 logstash_FTA_IMS is restarted"

                                                fi
fi
