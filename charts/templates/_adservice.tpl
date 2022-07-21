{{/*
Expand the name of the chart.
*/}}
{{- define "adservice.name" -}}
{{- default .Chart.Name .Values.adservice.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "adservice.fullname" -}}
{{- if .Values.adservice.fullnameOverride }}
{{- .Values.adservice.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.adservice.nameOverride }}
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
{{- define "adservice.selectorLabels" -}}
app.kubernetes.io/name: {{ include "adservice.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "adservice.labels" -}}
helm.sh/chart: {{ include "otel-demo-integration.chart" . }}
{{ include "adservice.selectorLabels" . }}
{{- if .Values.adservice.version }}
app.kubernetes.io/version: {{ .Values.adservice.version | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
