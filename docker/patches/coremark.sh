#!/bin/bash

LOG=/etc/bench.log
echo "<div><table>" > $LOG

GOV="/sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
if [ -f "$GOV" ];then
    CURRENT_GOVERNOR=$(cat $GOV)
    GOV_FLAG=1
else
    GOV_FLAG=0
fi

trap "echo killed;test $GOV_FLAG -eq 1 && echo ${CURRENT_GOVERNOR} > ${GOV} 2>/dev/null;echo '</table></div>' >> $LOG;rm -f /tmp/*.score;exit" 1 2 3 9 15

GOV_HOME='/sys/devices/system/cpu/cpufreq/'
govs=()
if [ $GOV_FLAG -eq 1 ];then
    POLICIES=$(cd $GOV_HOME && ls -d policy*)
    i=1
    for POLICY in $POLICIES;do
        CUR_GOV="${GOV_HOME}/${POLICY}/scaling_governor"
	govs[$i]=$(cat $CUR_GOV)
        echo "performance" > ${CUR_GOV} 2>/dev/null
	i=$((i+1))
    done
fi

echo "testing coremark ... "
sleep 1
COREMARK=$(/bin/coremark | tail -n 1 | awk '{print $4}')
# 分数取整
#COREMARK=${COREMARK%.*}
echo "CPU CoreMark : $COREMARK"
echo "<tr><td width=\"38%\">CPU CoreMark</td><td>$COREMARK</td></tr>" >> $LOG

if [ -x /usr/bin/openssl ];then
    CORES=$(grep processor /proc/cpuinfo | wc -l)

    PROJS="aes-128-gcm aes-256-gcm chacha20-poly1305"
    for P in $PROJS;do
        echo "testing $P ..."
        sleep 1
        /usr/bin/openssl speed -multi $CORES -evp $P 1>/tmp/${P}.score 2>/dev/null || echo "NA" >/tmp/${P}.score
        S=$(tail -n 1 /tmp/${P}.score | awk '{print $5}')
	echo "${P}(1K) : ${S}"
	echo "<tr><td>${P}(1K)</td><td>$S</td></tr>" >> $LOG
	rm -f /tmp/${P}.score
    done

fi

echo "</table></div>" >> $LOG

if [ $GOV_FLAG -eq 1 ];then
    i=1
    for POLICY in $POLICIES;do
        CUR_GOV="${GOV_HOME}/${POLICY}/scaling_governor"
        echo "${govs[$i]}" > ${CUR_GOV} 2>/dev/null
	i=$((i+1))
    done
fi

if [ -f "$LOG" ]; then
        sed -i '/coremark/d' /etc/crontabs/root
        crontab /etc/crontabs/root
fi
