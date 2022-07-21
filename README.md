# adservice-springcloud

reimplement opentelemetry-demo-webstore's adservice with nacos registry and sentinel

- [x] integrate nacos registry
- [ ] integrate sentinel

# set up
```shell
docker build adservice-springcloud:latest .
docker run -p 8081:8081 \
-p 8999:8999 \
-p 9555:9555 \
-e OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://localhost:4317 \
-e NACOS_SERVER=localhost:8848 \
adservice-springcloud:latest
```

# curl
```shell
grpcurl -plaintext -d '{"context_keys": ["clothing","hair"]}' localhost:9555 hipstershop.AdService/GetAds
```