# OpenTelemetry Demo Helm Chart

# Set up
```shell
helm repo add open-insight https://openinsight-proj.github.io/openinsight-helm-charts

helm install my-otel-demo open-insight/opentelemetry-demo -n webstore-demo --create-namespace
```

# demo-UI
we have a NodePort type svc named otel-demo-ui, find it and enjoy the otel-demo

# reimplement components
- [adservice](https://github.com/openinsight-proj/adservice#adservice-springcloud)


