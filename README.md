# adservice-springcloud

reimplement opentelemetry-demo-webstore's adservice with nacos registry and sentinel

- [x] integrate nacos registry
- [x] integrate sentinel

# set up

docker:
```shell
docker run -p 8081:8081 \
-p 8999:8999 \
-p 9555:9555 \
-e OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://localhost:4317 \
-e NACOS_SERVER=localhost:8848 \
-e SENTINEL_SERVER=localhost:34001 \
ghcr.io/openinsight-proj/adservice-springcloud:latest
```

helm
```shell
helm install adservice-integration ./charts -n opentelemetry-demo --create-namespace \
--set adservice.env.otelExporter=http://otel-collector.opentelemetry-demo.svc.cluster.local:4317 \
--set adservice.env.nacos_server=nacos-server.opentelemetry-demo.svc.cluster.local:8848 \
--set adservice.env.sentinel_server=sentinel-server.opentelemetry-demo.svc.cluster.local:34001 \
--set adservice.image.tag=adservice-v0.0.1 \
--set sentinel.image.tag=sentinel-v1.8.4
```

# curl
```shell
grpcurl -plaintext -d '{"context_keys": ["clothing","hair"]}' localhost:9555 hipstershop.AdService/GetAds
```