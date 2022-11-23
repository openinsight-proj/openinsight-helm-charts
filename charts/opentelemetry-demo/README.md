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

# support switch redis instance
we use build-in redis by default, if you want to use a redis create by redis-operation(we use [openebs](https://openebs.io/docs/user-guides/quickstart) as persistent
Volume, you can specific others by `--set redis_resource.storageClassName=your-storage-class`), 
your need: `--set redis_operator.enabled=true --set redis_resource.enabled=true`

