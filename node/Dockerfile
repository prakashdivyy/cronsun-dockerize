FROM alpine
RUN apk add unzip jq && \
    wget https://github.com/shunfei/cronsun/releases/download/v0.3.5/cronsun-v0.3.5-linux-amd64.zip && \
    unzip cronsun-v0.3.5-linux-amd64.zip && \
    mv cronsun-v0.3.5/* /bin/ && \
    apk del --purge unzip && \
    rm -Rf cronsun-v0.3.5* /var/cache/apk/* && \
    rm -rf /bin/cronweb /bin/csctl
ADD         run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]