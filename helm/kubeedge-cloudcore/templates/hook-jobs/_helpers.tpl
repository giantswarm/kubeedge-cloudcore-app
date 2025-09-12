{{- define "kubeEdgeHookServiceAccount" }}
{{- include "resource.default.name" $ }}-update-cilium
{{- end }}

{{- define "securityContext.runAsUser" -}}
1000
{{- end -}}
{{- define "securityContext.runAsGroup" -}}
1000
{{- end -}}

{{- define "jobContainerCommon" -}}
image: "{{ .Values.kubectlImage.registry }}/{{ .Values.kubectlImage.name }}:{{ .Values.kubectlImage.tag }}"
securityContext:
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false
  capabilities:
    drop:
    - ALL
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
resources:
  requests:
    memory: "64Mi"
    cpu: "10m"
  limits:
    memory: "256Mi"
    cpu: "100m"
{{- end }}