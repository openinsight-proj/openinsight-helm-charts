# OpenTelemetry Demo Helm Chart

## set up
helm
```shell
helm repo add open-telemetry-projdistr https://openinsight-proj.github.io/opentelemetry-demo-helm-chart
helm install my-otel-demo open-telemetry-projdistr/opentelemetry-demo -n webstore-demo
```