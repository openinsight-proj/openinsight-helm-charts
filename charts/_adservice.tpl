{{/*
Expand the name of the chart.
*/}}
{{- define "adservice.name" -}}
{{- if .Values.adservice.nameOverride }}
{{- .Values.adservice.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- "adservice" | trunc 63 | trimSuffix "-" }}
{{- end }}
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
{{- "adservice" | trunc 63 | trimSuffix "-" }}
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
helm.sh/chart: {{ include "opentelemetry-demo-webstore.chart" . }}
{{ include "adservice.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "adservice.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "adservice.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
