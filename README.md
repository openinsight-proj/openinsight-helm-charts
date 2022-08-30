# adservice-springcloud

reimplement opentelemetry-demo-webstore's adservice with nacos registry and sentinel

- [x] integrate nacos registry
- [x] integrate sentinel

# set up
helm
```shell
helm repo add open-telemetry-projdistr https://openinsight-proj.github.io/opentelemetry-demo-helm-chart
helm install my-otel-demo open-telemetry-projdistr/opentelemetry-demo -n webstore-demo --create-namespace
```

# demo-UI
we have a NodePort type svc named otel-demo-ui, find it and enjoy the otel-demo

# FAQ
