actinia
=======
A Helm chart for actinia

Current chart version is `1.1.8`



## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 12 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.actinia.cellLimit | string | `"100000000000"` |  |
| config.actinia.password | string | `"actinia-gdi"` |  |
| config.actinia.processNumLimit | string | `"1000"` |  |
| config.actinia.processTimeLimit | string | `"31536000"` |  |
| config.actinia.workercount | int | `1` |  |
| config.redis | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"mundialis/actinia-core"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0] | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.actiniaWorkerWorkspace.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.actiniaWorkerWorkspace.storageClassName | string | `"default"` |  |
| persistence.actiniaWorkerWorkspace.storageSize | string | `"50Gi"` |  |
| persistence.customVolume.enabled | bool | `false` |  |
| persistence.customVolume.readOnly | bool | `false` |  |
| persistence.enabled | bool | `false` |  |
| persistence.geodata.accessMode | string | `"ReadWriteMany"` |  |
| persistence.geodata.storageClassName | string | `"default"` |  |
| persistence.geodata.storageSize | string | `"10Gi"` |  |
| persistence.grassdb.accessMode | string | `"ReadWriteMany"` |  |
| persistence.grassdb.storageClassName | string | `"default"` |  |
| persistence.grassdb.storageSize | string | `"10Gi"` |  |
| persistence.resources.accessMode | string | `"ReadWriteMany"` |  |
| persistence.resources.storageClassName | string | `"default"` |  |
| persistence.resources.storageSize | string | `"10Gi"` |  |
| persistence.useExistingClaim | bool | `false` |  |
| persistence.userdata.accessMode | string | `"ReadWriteMany"` |  |
| persistence.userdata.storageClassName | string | `"default"` |  |
| persistence.userdata.storageSize | string | `"10Gi"` |  |
| podSecurityContext | object | `{}` |  |
| redis.cluster.enabled | bool | `false` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8088` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
