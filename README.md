# OpenInsight Helm charts

This repository contains [Helm](https://helm.sh/) charts for OpenTelemetry project.

## Usage

Helm must be installed to use the charts. Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash
helm repo add open-insight https://openinsight-proj.github.io/openinsight-helm-charts
```

## Helm Charts

You can then run helm search repo open-insight to see the charts.

### OpenInsight

The chart can be used to install [OpenInsight](https://github.com/openinsight-proj/openinsight) in a Kubernetes cluster. More detailed documentation can be found in [OpenInsight chart directory](./charts/openinsight/README.md).

### Archive: OpenTelemetry Demo

The chart can be used to install OpenTelemetry Demo in a Kubernetes cluster. More detailed documentation can be found in [OpenTelemetry Demo chart directory](./charts/opentelemetry-demo/README.md).

### OpenTelemetry Demo Lite

The chart can be used to install OpenTelemetry Demo in a Kubernetes cluster. More detailed documentation can be found in [OpenTelemetry Demo chart directory](./charts/opentelemetry-demo-lite/README.md).
