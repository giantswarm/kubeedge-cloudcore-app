# Values schema documentation

This page lists all available configuration options, based on the [configuration values schema](values.schema.json).

<!-- DOCS_START -->

### 
Properties within the `.iptablesManager` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `iptablesManager.affinity` |**None**|**Type:** `object`<br/>|
| `iptablesManager.affinity.nodeAffinity` |**None**|**Type:** `object`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |**None**|**Type:** `object`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |**None**|**Type:** `array`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*]` |**None**|**Type:** `object`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions` |**None**|**Type:** `array`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*]` |**None**|**Type:** `object`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key` |**None**|**Type:** `string`<br/>|
| `iptablesManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].operator` |**None**|**Type:** `string`<br/>|
| `iptablesManager.annotations` |**None**|**Type:** `object`<br/>|
| `iptablesManager.enable` |**None**|**Type:** `boolean`<br/>|
| `iptablesManager.framework` |**None**|**Type:** `string`<br/>|
| `iptablesManager.hostNetWork` |**None**|**Type:** `boolean`<br/>|
| `iptablesManager.image` |**None**|**Type:** `object`<br/>|
| `iptablesManager.image.nftRepository` |**None**|**Type:** `string`<br/>|
| `iptablesManager.image.pullPolicy` |**None**|**Type:** `string`<br/>|
| `iptablesManager.image.pullSecrets` |**None**|**Type:** `array`<br/>|
| `iptablesManager.image.pullSecrets[*]` |**None**||
| `iptablesManager.image.repository` |**None**|**Type:** `string`<br/>|
| `iptablesManager.image.tag` |**None**|**Type:** `string`<br/>|
| `iptablesManager.labels` |**None**|**Type:** `object`<br/>|
| `iptablesManager.labels.k8s-app` |**None**|**Type:** `string`<br/>|
| `iptablesManager.labels.kubeedge` |**None**|**Type:** `string`<br/>|
| `iptablesManager.mode` |**None**|**Type:** `string`<br/>|
| `iptablesManager.nodeSelector` |**None**|**Type:** `object`<br/>|
| `iptablesManager.resources` |**None**|**Type:** `object`<br/>|
| `iptablesManager.resources.limits` |**None**|**Type:** `object`<br/>|
| `iptablesManager.resources.limits.cpu` |**None**|**Type:** `string`<br/>|
| `iptablesManager.resources.limits.memory` |**None**|**Type:** `string`<br/>|
| `iptablesManager.resources.requests` |**None**|**Type:** `object`<br/>|
| `iptablesManager.resources.requests.cpu` |**None**|**Type:** `string`<br/>|
| `iptablesManager.resources.requests.memory` |**None**|**Type:** `string`<br/>|
| `iptablesManager.securityContext` |**None**|**Type:** `object`<br/>|
| `iptablesManager.securityContext.capabilities` |**None**|**Type:** `object`<br/>|
| `iptablesManager.securityContext.capabilities.add` |**None**|**Type:** `array`<br/>|
| `iptablesManager.securityContext.capabilities.add[*]` |**None**|**Type:** `string`<br/>|
| `iptablesManager.securityContext.capabilities.add[*]` |**None**|**Type:** `string`<br/>|
| `iptablesManager.tolerations` |**None**|**Type:** `array`<br/>|
| `iptablesManager.tolerations[*]` |**None**||

### 
Properties within the `.kubectlImage` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `kubectlImage.name` |**None**|**Type:** `string`<br/>|
| `kubectlImage.registry` |**None**|**Type:** `string`<br/>|
| `kubectlImage.tag` |**None**|**Type:** `string`<br/>|

### 
Properties within the `.mosquitto` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `mosquitto.affinity` |**None**|**Type:** `object`<br/>|
| `mosquitto.affinity.nodeAffinity` |**None**|**Type:** `object`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |**None**|**Type:** `object`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |**None**|**Type:** `array`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*]` |**None**|**Type:** `object`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions` |**None**|**Type:** `array`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*]` |**None**|**Type:** `object`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key` |**None**|**Type:** `string`<br/>|
| `mosquitto.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].operator` |**None**|**Type:** `string`<br/>|
| `mosquitto.annotations` |**None**|**Type:** `object`<br/>|
| `mosquitto.enable` |**None**|**Type:** `boolean`<br/>|
| `mosquitto.image` |**None**|**Type:** `object`<br/>|
| `mosquitto.image.pullPolicy` |**None**|**Type:** `string`<br/>|
| `mosquitto.image.pullSecrets` |**None**|**Type:** `array`<br/>|
| `mosquitto.image.pullSecrets[*]` |**None**||
| `mosquitto.image.repository` |**None**|**Type:** `string`<br/>|
| `mosquitto.image.tag` |**None**|**Type:** `string`<br/>|
| `mosquitto.labels` |**None**|**Type:** `object`<br/>|
| `mosquitto.labels.k8s-app` |**None**|**Type:** `string`<br/>|
| `mosquitto.labels.kubeedge` |**None**|**Type:** `string`<br/>|
| `mosquitto.resources` |**None**|**Type:** `object`<br/>|
| `mosquitto.resources.limits` |**None**|**Type:** `object`<br/>|
| `mosquitto.resources.limits.cpu` |**None**|**Type:** `string`<br/>|
| `mosquitto.resources.limits.memory` |**None**|**Type:** `string`<br/>|
| `mosquitto.resources.requests` |**None**|**Type:** `object`<br/>|
| `mosquitto.resources.requests.cpu` |**None**|**Type:** `string`<br/>|
| `mosquitto.resources.requests.memory` |**None**|**Type:** `string`<br/>|
| `mosquitto.tolerations` |**None**|**Type:** `array`<br/>|
| `mosquitto.tolerations[*]` |**None**||

### 
Properties within the `.admission` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `admission.affinity` |**None**|**Type:** `object`<br/>|
| `admission.affinity.nodeAffinity` |**None**|**Type:** `object`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |**None**|**Type:** `object`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |**None**|**Type:** `array`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*]` |**None**|**Type:** `object`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions` |**None**|**Type:** `array`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*]` |**None**|**Type:** `object`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key` |**None**|**Type:** `string`<br/>|
| `admission.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].operator` |**None**|**Type:** `string`<br/>|
| `admission.annoations` |**None**|**Type:** `object`<br/>|
| `admission.certsSecretName` |**None**|**Type:** `string`<br/>|
| `admission.enable` |**None**|**Type:** `boolean`<br/>|
| `admission.image` |**None**|**Type:** `object`<br/>|
| `admission.image.pullPolicy` |**None**|**Type:** `string`<br/>|
| `admission.image.pullSecrets` |**None**|**Type:** `array`<br/>|
| `admission.image.pullSecrets[*]` |**None**||
| `admission.image.repository` |**None**|**Type:** `string`<br/>|
| `admission.image.tag` |**None**|**Type:** `string`<br/>|
| `admission.labels` |**None**|**Type:** `object`<br/>|
| `admission.labels.k8s-app` |**None**|**Type:** `string`<br/>|
| `admission.labels.kubeedge` |**None**|**Type:** `string`<br/>|
| `admission.nodeSelector` |**None**|**Type:** `object`<br/>|
| `admission.replicaCount` |**None**|**Type:** `integer`<br/>|
| `admission.resources` |**None**|**Type:** `object`<br/>|
| `admission.resources.limits` |**None**|**Type:** `object`<br/>|
| `admission.resources.limits.cpu` |**None**|**Type:** `string`<br/>|
| `admission.resources.limits.memory` |**None**|**Type:** `string`<br/>|
| `admission.resources.requests` |**None**|**Type:** `object`<br/>|
| `admission.resources.requests.cpu` |**None**|**Type:** `string`<br/>|
| `admission.resources.requests.memory` |**None**|**Type:** `string`<br/>|
| `admission.tolerations` |**None**|**Type:** `array`<br/>|
| `admission.tolerations[*]` |**None**||

### 
Properties within the `.cloudCore` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `cloudCore.affinity` |**None**|**Type:** `object`<br/>|
| `cloudCore.affinity.nodeAffinity` |**None**|**Type:** `object`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |**None**|**Type:** `object`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |**None**|**Type:** `array`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*]` |**None**|**Type:** `object`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions` |**None**|**Type:** `array`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*]` |**None**|**Type:** `object`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key` |**None**|**Type:** `string`<br/>|
| `cloudCore.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].operator` |**None**|**Type:** `string`<br/>|
| `cloudCore.annotations` |**None**|**Type:** `object`<br/>|
| `cloudCore.featureGates` |**None**|**Type:** `object`<br/>|
| `cloudCore.featureGates.requireAuthorization` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.hostNetWork` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.image` |**None**|**Type:** `object`<br/>|
| `cloudCore.image.pullPolicy` |**None**|**Type:** `string`<br/>|
| `cloudCore.image.pullSecrets` |**None**|**Type:** `array`<br/>|
| `cloudCore.image.pullSecrets[*]` |**None**||
| `cloudCore.image.repository` |**None**|**Type:** `string`<br/>|
| `cloudCore.image.tag` |**None**|**Type:** `string`<br/>|
| `cloudCore.labels` |**None**|**Type:** `object`<br/>|
| `cloudCore.labels.k8s-app` |**None**|**Type:** `string`<br/>|
| `cloudCore.labels.kubeedge` |**None**|**Type:** `string`<br/>|
| `cloudCore.modules` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudHub` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudHub.advertiseAddress` |**None**|**Type:** `array`<br/>|
| `cloudCore.modules.cloudHub.advertiseAddress[*]` |**None**||
| `cloudCore.modules.cloudHub.dnsNames` |**None**|**Type:** `array`<br/>|
| `cloudCore.modules.cloudHub.dnsNames[*]` |**None**|**Type:** `string`<br/>|
| `cloudCore.modules.cloudHub.https` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudHub.https.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.cloudHub.nodeLimit` |**None**|**Type:** `string`<br/>|
| `cloudCore.modules.cloudHub.quic` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudHub.quic.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.cloudHub.quic.maxIncomingStreams` |**None**|**Type:** `string`<br/>|
| `cloudCore.modules.cloudHub.quic.port` |**None**|**Type:** `integer`<br/>|
| `cloudCore.modules.cloudHub.websocket` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudHub.websocket.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.cloudHub.websocket.port` |**None**|**Type:** `integer`<br/>|
| `cloudCore.modules.cloudStream` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.cloudStream.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.dynamicController` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.dynamicController.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.router` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.router.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.modules.taskManager` |**None**|**Type:** `object`<br/>|
| `cloudCore.modules.taskManager.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.nodeSelector` |**None**|**Type:** `object`<br/>|
| `cloudCore.replicaCount` |**None**|**Type:** `integer`<br/>|
| `cloudCore.resources` |**None**|**Type:** `object`<br/>|
| `cloudCore.resources.limits` |**None**|**Type:** `object`<br/>|
| `cloudCore.resources.limits.cpu` |**None**|**Type:** `string`<br/>|
| `cloudCore.resources.limits.memory` |**None**|**Type:** `string`<br/>|
| `cloudCore.resources.requests` |**None**|**Type:** `object`<br/>|
| `cloudCore.resources.requests.cpu` |**None**|**Type:** `string`<br/>|
| `cloudCore.resources.requests.memory` |**None**|**Type:** `string`<br/>|
| `cloudCore.securityContext` |**None**|**Type:** `object`<br/>|
| `cloudCore.securityContext.privileged` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.service` |**None**|**Type:** `object`<br/>|
| `cloudCore.service.annotations` |**None**|**Type:** `object`<br/>|
| `cloudCore.service.cloudhubHttpsNodePort` |**None**|**Type:** `string`<br/>|
| `cloudCore.service.cloudhubNodePort` |**None**|**Type:** `string`<br/>|
| `cloudCore.service.cloudhubQuicNodePort` |**None**|**Type:** `string`<br/>|
| `cloudCore.service.cloudstreamNodePort` |**None**|**Type:** `string`<br/>|
| `cloudCore.service.enable` |**None**|**Type:** `boolean`<br/>|
| `cloudCore.service.tunnelNodePort` |**None**|**Type:** `string`<br/>|
| `cloudCore.service.type` |**None**|**Type:** `string`<br/>|
| `cloudCore.strategy` |**None**|**Type:** `object`<br/>|
| `cloudCore.tolerations` |**None**|**Type:** `array`<br/>|
| `cloudCore.tolerations[*]` |**None**||

### 
Properties within the `.controllerManager` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `controllerManager.affinity` |**None**|**Type:** `object`<br/>|
| `controllerManager.affinity.nodeAffinity` |**None**|**Type:** `object`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |**None**|**Type:** `object`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |**None**|**Type:** `array`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*]` |**None**|**Type:** `object`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions` |**None**|**Type:** `array`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*]` |**None**|**Type:** `object`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].key` |**None**|**Type:** `string`<br/>|
| `controllerManager.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[*].matchExpressions[*].operator` |**None**|**Type:** `string`<br/>|
| `controllerManager.annotations` |**None**|**Type:** `object`<br/>|
| `controllerManager.enable` |**None**|**Type:** `boolean`<br/>|
| `controllerManager.image` |**None**|**Type:** `object`<br/>|
| `controllerManager.image.pullPolicy` |**None**|**Type:** `string`<br/>|
| `controllerManager.image.pullSecrets` |**None**|**Type:** `array`<br/>|
| `controllerManager.image.pullSecrets[*]` |**None**||
| `controllerManager.image.repository` |**None**|**Type:** `string`<br/>|
| `controllerManager.image.tag` |**None**|**Type:** `string`<br/>|
| `controllerManager.labels` |**None**|**Type:** `object`<br/>|
| `controllerManager.labels.k8s-app` |**None**|**Type:** `string`<br/>|
| `controllerManager.labels.kubeedge` |**None**|**Type:** `string`<br/>|
| `controllerManager.nodeSelector` |**None**|**Type:** `object`<br/>|
| `controllerManager.resources` |**None**|**Type:** `object`<br/>|
| `controllerManager.resources.limits` |**None**|**Type:** `object`<br/>|
| `controllerManager.resources.limits.cpu` |**None**|**Type:** `string`<br/>|
| `controllerManager.resources.limits.memory` |**None**|**Type:** `string`<br/>|
| `controllerManager.resources.requests` |**None**|**Type:** `object`<br/>|
| `controllerManager.resources.requests.cpu` |**None**|**Type:** `string`<br/>|
| `controllerManager.resources.requests.memory` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations` |**None**|**Type:** `array`<br/>|
| `controllerManager.tolerations[*]` |**None**|**Type:** `object`<br/>|
| `controllerManager.tolerations[*]` |**None**|**Type:** `object`<br/>|
| `controllerManager.tolerations[*].effect` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations[*].effect` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations[*].key` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations[*].key` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations[*].operator` |**None**|**Type:** `string`<br/>|
| `controllerManager.tolerations[*].operator` |**None**|**Type:** `string`<br/>|

### Other

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `appVersion` |**None**|**Type:** `string`<br/>|



<!-- DOCS_END -->
