#!/bin/sh

cd /bin/conf

# Change mongo config
if [ -z ${MONGO_HOST+x} ]; then
        MONGO_HOST="127.0.0.1"
fi

if [ -z ${MONGO_PORT+x} ]; then
        MONGO_PORT="27017"
fi

if [ -z ${MONGO_USER+x} ]; then
        MONGO_USER=""
fi

if [ -z ${MONGO_PASSWORD+x} ]; then
        MONGO_PASSWORD=""
fi

if [ -z ${MONGO_DATABASE+x} ]; then
        MONGO_DATABASE="cronsun"
fi

MONGO_HOST_PORT="${MONGO_HOST}:${MONGO_PORT}"

jq -e --arg mongohostport "$MONGO_HOST_PORT" '(."Hosts"[0]) = $mongohostport' db.json > db.json.tmp && cp db.json.tmp db.json
jq -e --arg mongousername "$MONGO_USER" '(."UserName") = $mongousername' db.json > db.json.tmp && cp db.json.tmp db.json
jq -e --arg mongopassword "$MONGO_PASSWORD" '(."Password") = $mongopassword' db.json > db.json.tmp && cp db.json.tmp db.json
jq -e --arg mongodb "$MONGO_DATABASE" '(."Database") = $mongodb' db.json > db.json.tmp && cp db.json.tmp db.json

rm db.json.tmp

# Change etcd config
if [ -z ${ETCD_HOST+x} ]; then
        ETCD_HOST="127.0.0.1"
fi

if [ -z ${ETCD_PORT+x} ]; then
        ETCD_PORT="2379"
fi

if [ -z ${ETCD_USER+x} ]; then
        ETCD_USER=""
fi

if [ -z ${ETCD_PASSWORD+x} ]; then
        ETCD_PASSWORD=""
fi

ETCD_HOST_PORT="http://${ETCD_HOST}:${ETCD_PORT}"

jq -e --arg etcdhostport "$ETCD_HOST_PORT" '(."Endpoints"[0]) = $etcdhostport' etcd.json > etcd.json.tmp && cp etcd.json.tmp etcd.json
jq -e --arg etcdusername "$ETCD_USER" '(."Username") = $etcdusername' etcd.json > etcd.json.tmp && cp etcd.json.tmp etcd.json
jq -e --arg etcdpassword "$ETCD_PASSWORD" '(."Password") = $etcdpassword' etcd.json > etcd.json.tmp && cp etcd.json.tmp etcd.json

rm etcd.json.tmp

cd ..

exec /bin/cronnode -conf conf/base.json