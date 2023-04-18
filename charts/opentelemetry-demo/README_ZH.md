# OpenTelemetry Demo Helm Chart

这个 Chart 是官方 [OpenTelemetry Demo](https://github.com/open-telemetry/opentelemetry-demo) 和 
[OpenTelemetry Demo Chart](https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-demo)
的扩展。

## 涉及的改动

我们对官方的 Demo 做了一定的改造，以下是具体的改造细节。

### 重写的组件

#### [Adservice](https://github.com/openinsight-proj/adservice#adservice-springcloud)

这个组件在重写后增加了以下功能：
- 服务接入 nacos
- 服务接入 sentinel
- 支持 grpcurl 请求
- [暴露 Prometheus 指标](https://github.com/openinsight-proj/adservice#metrics)
- [延时模拟](https://github.com/openinsight-proj/adservice#mock-latency)
- [50% 的请求错误率](https://github.com/openinsight-proj/adservice#mock-error)
- 请求 Dataservice 并从 mysql 中获取数据

### 增加的组件

#### [Dataservice](https://github.com/openinsight-proj/opentelemetry-demo/tree/daocloud/src/dataservice)

这个组件只被 Adservice 调用，在收到请求后，它会去 Mysql 中获取相关的数据并返回给 Adservice。

### 官方 chart 参数改造

1. 我们关闭了所有非业务组件，比如： Opentelemetry collector, Prometheus, Jaeger, Grafana等，在我们的版本中不需要用它们展示数据。
业务的观测性数据传输路径变成了：`Components --> Insight-agent OTel collector`。

2. 支持通过 Redis operator 拉起 Redis 实例。默认情况下使用官方的方式创建 Redis, 
   你可以通过 `--set redis_operator.enabled=true --set redis_resource.enabled=true` 开启 redis operator
   并下发 redis CR, 最后由 redis operator 拉起 redis 实例。（你需要`--set redis_resource.storageClassName=your-PersistentVolume`
   指定存储卷，才能够成功启动 redis）

3. 给 Frontend 服务添加一个 NodePort SVC

## 安装

_前提条件：请保证 Insight agent 已经安装并就绪_

```shell
helm repo add open-insight https://openinsight-proj.github.io/openinsight-helm-charts

helm install my-otel-demo open-insight/opentelemetry-demo -n webstore-demo --create-namespace
```




