{{/*
Expand the name of the chart.
*/}}
{{- define "sentinel.server.name" -}}
{{- default .Chart.Name .Values.sentinel.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sentinel.server.fullname" -}}
{{- if .Values.sentinel.fullnameOverride }}
{{- .Values.sentinel.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.sentinel.nameOverride }}
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
{{- define "sentinel.server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sentinel.server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sentinel.server.labels" -}}
helm.sh/chart: {{ include "opentelemetry-demo.chart" . }}
{{ include "sentinel.server.selectorLabels" . }}
{{- if .Values.sentinel.version }}
app.kubernetes.io/version: {{ .Values.sentinel.version  | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}