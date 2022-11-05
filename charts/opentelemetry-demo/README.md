# OpenTelemetry Demo Helm Chart

# adservice-springcloud

reimplement opentelemetry-demo-webstore's adservice with nacos registry and sentinel

- [x] integrate nacos registry
- [x] integrate sentinel

# set up
helm
```shell
helm repo add openinsight-projdistr https://openinsight-proj.github.io/openinsight-helm-charts

helm install my-otel-demo openinsight-projdistr/opentelemetry-demo -n webstore-demo --create-namespace
```

# demo-UI
we have a NodePort type svc named otel-demo-ui, find it and enjoy the otel-demo

# FAQ


