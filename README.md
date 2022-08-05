# adservice-springcloud

reimplement opentelemetry-demo-webstore's adservice with nacos registry and sentinel

- [x] integrate nacos registry
- [x] integrate sentinel

# set up

```shell
helm install my-otel-demo . -n opentelemetry-demo --create-namespace
```

# demo-ui
we have a NodePort type svc named otel-demo-ui, find it and enjoy the otel-demo

# FAQ
1. current otel-demo sub-chart need enhance on extensibility and we have already 
push PR to its community. Now, we have modified the sub-chart locally, it's only a 
temporary status.