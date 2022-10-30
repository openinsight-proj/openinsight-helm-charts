# opentelemetry demo helm chart
## set up

_make sure insight-agent has already deployed._
```shell
helm repo add open-telemetry-projdistr https://openinsight-proj.github.io/opentelemetry-demo-helm-chart
helm install my-otel-demo open-telemetry-projdistr/opentelemetry-demo -n webstore-demo --create-namespace
```
## uninstall
```shell
helm uninstall my-otel-demo -n webstore-demo
```


## demo-UI
we have a NodePort type svc named otel-demo-ui, find it and enjoy the otel-demo
