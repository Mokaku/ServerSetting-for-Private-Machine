#!/bin/bash

## NUM=`date | grep 'JST' | awk '{print $4}' | cut -b 4-4`
NUM=""

# 更新サーバは複数あるため時刻によって １～５ まで振り分けるようにしてあるが
# そもそも dyn.value-domain.com/cgi-bin/dyn.fcg　にアクセスすれば自動的に
# 負荷分散してアクセスするようになっている。そのため NUM の値を入れる必要はない（＾＾；
# まあ、どっちか好きな方にしてください。
# 自動負荷分散するには NUM="" としてください。
#
if [ $NUM = '0' ]; then
  NUM=""
fi

SUBDM="dyn$NUM"
TO="-connect_timeout=180"


# 自グローバルＩＰアドレスを取得する。
# この場合は自分のルーター(NEC WR7600H) から…
### REMOTEIP=`/usr/local/etc/DDNS/warpstar.pl`
#echo "remoteip = $REMOTEIP"

# 自グローバルＩＰアドレスが取得できない場合
# しかし、よそ様のスクリプトを勝手に使わないように…。
#
#REMOTEIP=`/usr/local/bin/lynx -dump 'http://ddo.jp/remote_addr.php' | grep '.' | awk '{print $1}' | cut -b 13-`
#
REMOTEIP=`/usr/bin/lynx -dump 'http://www.tobe.asia/remote_addr.php'`

# CGI Script
CGI=value-domain.com/cgi-bin/dyn.fcg

# domain / password 
DOMAIN="tobe.asia" ## <-- 自分のドメイン名
PASS="nanban3594" ##  <-- パスワード
MESSAGE="You_are_part_of_MilkyWay_galaxy_too." ## <-- あなたのお気に入りの言葉

IPFILE="/tmp/${DOMAIN}.ipaddress"

if [ ! -f "$IPFILE" ]; then
  echo "$MESSAGE" > "$IPFILE"
fi

if [ $REMOTEIP == "ERR" ]; then
  echo "$MESSAGE" > "$IPFILE"
  KEKKA="could not retrieve global IP address"
  /usr/bin/logger -p daemon.info -t $DOMAIN $KEKKA
  exit 0
fi

if [ x"$REMOTEIP" != x`cat "$IPFILE"` ]; then

##  HOST="@"
##  URL="http://${SUBDM}.${CGI}?d=${DOMAIN}&p=${PASS}&h=${HOST}&i=${REMOTEIP}"
##  RESULT1=`/usr/local/bin/lynx ${TO} -dump $URL | head -10 | grep 'status' | awk '{print $1}'`
##  /usr/bin/logger -p daemon.info -t ${HOST}.${DOMAIN} ipaddress=$REMOTEIP server=$SUBDM $RESULT1

  HOST="home"
  URL="http://${SUBDM}.${CGI}?d=${DOMAIN}&p=${PASS}&h=${HOST}&i=${REMOTEIP}"
##  RESULT1=`/usr/local/bin/lynx ${TO} -dump $URL | head -10 | grep 'status' | awk '{print $1}'`
  RESULT1=`/usr/bin/lynx ${TO} -dump $URL | head -10 | grep 'status' | awk '{print $1}'`
  /usr/bin/logger -p daemon.info -t ${HOST}.${DOMAIN} ipaddress=$REMOTEIP server=$SUBDM $RESULT2

  if [ $RESULT1 == "status=0" ]; then
    if [ $RESULT2 == "status=0" ]; then
      echo "$REMOTEIP" > "$IPFILE"
    fi
  fi

fi
exit 0

