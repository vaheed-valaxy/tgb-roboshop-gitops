{{- define "common.secret" }}

{{- if .Values.secret.create }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.secret.name }}                            # shopverse-config
  # namespace: {{ .Values.namespace }}                       # shopverse-dev
  type: Opaque
  {{- with .Values.labels }}
  labels:
  {{- toYaml . | nindent 4 }}
  {{- end }}
{{- if .Values.secret.values }}
data:
  {{- range $key, $value := .Values.secret.values }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end }}
{{- end }}

{{- end }}
