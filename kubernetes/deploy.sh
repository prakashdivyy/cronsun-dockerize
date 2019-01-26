sed -e "s/\${K8S_NAMESPACE}/$K8S_NAMESPACE/" template/namespace.template.json > edited-namespace.json
kubectl apply -f edited-namespace.json

sed -e "s/\${K8S_NAMESPACE}/$K8S_NAMESPACE/" template/cronsun-node.template.yml | sed -e "s/\${MONGO_HOST}/$MONGO_HOST/" | sed -e "s/\${MONGO_PORT}/$MONGO_PORT/" | sed -e "s/\${MONGO_USER}/$MONGO_USER/" | sed -e "s/\${MONGO_PASSWORD}/$MONGO_PASSWORD/" | sed -e "s/\${MONGO_DATABASE}/$MONGO_DATABASE/" | sed -e "s/\${ETCD_HOST}/$ETCD_HOST/" | sed -e "s/\${ETCD_PORT}/$ETCD_PORT/" | sed -e "s/\${ETCD_USER}/$ETCD_USER/" | sed -e "s/\${ETCD_PASSWORD}/$ETCD_PASSWORD/" > edited-cronsun-node.yml
kubectl apply -f edited-cronsun-node.yml

sed -e "s/\${K8S_NAMESPACE}/$K8S_NAMESPACE/" template/cronsun-web.template.yml | sed -e "s/\${MONGO_HOST}/$MONGO_HOST/" | sed -e "s/\${MONGO_PORT}/$MONGO_PORT/" | sed -e "s/\${MONGO_USER}/$MONGO_USER/" | sed -e "s/\${MONGO_PASSWORD}/$MONGO_PASSWORD/" | sed -e "s/\${MONGO_DATABASE}/$MONGO_DATABASE/" | sed -e "s/\${ETCD_HOST}/$ETCD_HOST/" | sed -e "s/\${ETCD_PORT}/$ETCD_PORT/" | sed -e "s/\${ETCD_USER}/$ETCD_USER/" | sed -e "s/\${ETCD_PASSWORD}/$ETCD_PASSWORD/" > edited-cronsun-web.yml
kubectl apply -f edited-cronsun-web.yml

rm -rf edited-*