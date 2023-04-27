## 🌱 Copyright © 2022 Nana Direct. All rights reserved
## Author: elhussein <elhussein.mohamed@nana.sa>

{{/* Create chart name and version as used by the chart label */}}
{{- define "app.fullname" }}
{{- printf "%s-%s" .Release.Name .Values.app.version | replace "." "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* release name */}}
{{- define "release.name" }}
{{- .Release.Name | replace "." "-" -}}
{{- end }}

{{/* Common labels */}}
{{- define "verse.labels" }}
{{- include "verse.selector-labels" . }}
app.kubernetes.io/version: {{ .Values.app.version | quote }}
app.kubernetes.io/revision: {{ .Release.Revision | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/component: {{ default "" .Values.component | quote }}
app.kubernetes.io/part-of: "nana-verse"
helm.sh/chart: {{ include "app.fullname" . }}
{{- end }}

{{/* Selector labels */}}
{{- define "verse.selector-labels" }}
env: {{ .Release.Namespace | quote }}
app.kubernetes.io/name: {{ .Release.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/* Config labels */}}
{{- define "verse.config-labels" }}
app.kubernetes.io/version: {{ .Values.app.version | quote }}
app.kubernetes.io/revision: {{ .Release.Revision | quote }}
{{- end }}

{{/* prefix for environmental variables */}}
{{- define "verse.envPrefix" }}
{{- printf "%s_" .app.envPrefix | trimPrefix "_" -}}
{{- end }}
