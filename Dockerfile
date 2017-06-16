FROM alpine

RUN apk --no-cache add curl zip bash
WORKDIR /tmp
RUN curl -sSL https://s3.dualstack.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/aws-xray-daemon-linux-2.x.zip > xray.zip
RUN unzip xray.zip

FROM alpine
COPY --from=0 /tmp/xray /bin/xray

EXPOSE 2000/udp

ENTRYPOINT ["/bin/xray"]
