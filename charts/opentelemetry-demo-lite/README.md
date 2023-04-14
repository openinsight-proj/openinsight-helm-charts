# OpenTelemetry Demo Helm Chart

This chart is an extension of official [OpenTelemetry Demo](https://github.com/open-telemetry/opentelemetry-demo) and 
official [OpenTelemetry Demo Chart](https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-demo)


# Demo Architecture
```mermaid
graph TD
subgraph Service Diagram
adservice(Ad Service):::java
dataservice(Data Service):::java
cache[(Cache<br/>&#40redis&#41)]
cartservice(Cart Service):::dotnet
checkoutservice-v2(Checkout Service):::golang
frontend(Frontend):::typescript
loadgenerator([Load Generator]):::python
paymentservice(Payment Service):::javascript
productcatalogservice(Product Catalog Service):::golang
quoteservice(Quote Service):::php
shippingservice(Shipping Service):::rust
adstore[(DataService Store<br/>&#40Mysql DB&#41)]

Internet -->|HTTP| frontend

loadgenerator -->|HTTP| frontend

checkoutservice-v2 --->|gRPC| cartservice -->|TCP| cache
checkoutservice-v2 --->|gRPC| productcatalogservice
checkoutservice-v2 --->|gRPC| paymentservice
checkoutservice-v2 -->|gRPC| shippingservice

frontend -->|gRPC| adservice
frontend -->|gRPC| cartservice
frontend -->|gRPC| productcatalogservice
frontend -->|gRPC| checkoutservice-v2
frontend -->|gRPC| shippingservice -->|HTTP| quoteservice

adservice -->|HTTP| dataservice
dataservice ---> |TCP| adstore

end

classDef dotnet fill:#178600,color:white;
classDef golang fill:#00add8,color:black;
classDef java fill:#b07219,color:white;
classDef javascript fill:#f1e05a,color:black;
classDef php fill:#4f5d95,color:white;
classDef python fill:#3572A5,color:white;
classDef rust fill:#dea584,color:black;
classDef typescript fill:#e98516,color:black;
```

```mermaid
graph TD
subgraph Service Legend
  dotnetsvc(.NET):::dotnet
  golangsvc(Go):::golang
  javasvc(Java):::java
  javascriptsvc(JavaScript):::javascript
  phpsvc(PHP):::php
  pythonsvc(Python):::python
  rustsvc(Rust):::rust
  typescriptsvc(TypeScript):::typescript
end

classDef dotnet fill:#178600,color:white;
classDef golang fill:#00add8,color:black;
classDef java fill:#b07219,color:white;
classDef javascript fill:#f1e05a,color:black;
classDef php fill:#4f5d95,color:white;
classDef python fill:#3572A5,color:white;
classDef rust fill:#dea584,color:black;
classDef typescript fill:#e98516,color:black;
```

# Set up

```shell
helm repo add open-insight https://openinsight-proj.github.io/openinsight-helm-charts

helm install webstore-demo-lite open-insight/opentelemetry-demo-lite -n webstore-demo --create-namespace
```

# demo-UI

we have a NodePort type svc named webstore-ui, find it and enjoy the webstore demo

# reimplement components

- [adservice](https://github.com/openinsight-proj/opentelemetry-demo/tree/daocloud/src/adservice-v2#adservice-springcloud)
- [checkoutservice](https://github.com/openinsight-proj/opentelemetry-demo/tree/daocloud/src/checkoutservice-v2#checkout-service)

# support switch redis instance

we use build-in redis by default, if you want to use a redis create by redis-operation(we use
[openebs](https://openebs.io/) as PersistentVolume, if you want to use others: `--set redis_resource.storageClassName=your-PersistentVolume` ),
your need: `--set redis_operator.enabled=true --set redis_resource.enabled=true`

# note 

## service listed bellow are disable by default
- adservice
- dataservice
- mysql
