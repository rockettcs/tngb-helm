

{{- define "app.fullname" -}}
{{- if .Values.application.name }}
{{- printf "%s"  .Values.application.name }}
{{- else -}}
{{ print .Chart.Name }}
{{- end -}}
{{- end -}}



{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
helm.sh/chart: {{ include "app.chart" . }}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
component: {{ .Values.labels.component }}
deploymentconfig: {{ .Values.labels.deploymentconfig }}
group: {{ .Values.labels.group }}
project: {{ .Values.labels.project }}
provider: {{ .Values.labels.provider }}
version: {{ .Values.labels.version }}
{{- end }}

