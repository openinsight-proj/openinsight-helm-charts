{{/*
Expand the name of the chart.
*/}}
{{- define "nacos.server.name" -}}
{{- default .Chart.Name .Values.nacos.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nacos.server.fullname" -}}
{{- if .Values.nacos.fullnameOverride }}
{{- .Values.nacos.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nacos.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nacos.server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nacos.server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nacos.server.labels" -}}
helm.sh/chart: {{ include "otel-demo-integration.chart" . }}
{{ include "nacos.server.selectorLabels" . }}
{{- if .Values.nacos.version }}
app.kubernetes.io/version: {{ .Values.nacos.version  | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}