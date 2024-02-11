
# Exposing applications using services

<https://cloud.google.com/kubernetes-engine/docs/how-to/exposing-apps>

## Create a GKE Cluster

Lazlo@my-machine gcp-cicd-3 % cd terraform-gke 
Lazlo@my-machine terraform-gke % 
Lazlo@my-machine terraform-gke % terraform apply                                 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # google_container_cluster.autopilot will be created
  + resource "google_container_cluster" "autopilot" {
      + cluster_ipv4_cidr           = (known after apply)
      + datapath_provider           = (known after apply)
      + default_max_pods_per_node   = (known after apply)
      + deletion_protection         = false
      + enable_autopilot            = true
      + enable_intranode_visibility = true
      + enable_kubernetes_alpha     = false
      + enable_l4_ilb_subsetting    = false
      + enable_legacy_abac          = false
      + enable_shielded_nodes       = true
      + endpoint                    = (known after apply)
      + id                          = (known after apply)
      + label_fingerprint           = (known after apply)
      + location                    = "europe-west1"
      + logging_service             = (known after apply)
      + master_version              = (known after apply)
      + monitoring_service          = (known after apply)
      + name                        = "autopilot-cluster-1"
      + network                     = "default"
      + networking_mode             = "VPC_NATIVE"
      + node_locations              = (known after apply)
      + node_version                = (known after apply)
      + operation                   = (known after apply)
      + private_ipv6_google_access  = (known after apply)
      + project                     = "gcp-terraform2"
      + self_link                   = (known after apply)
      + services_ipv4_cidr          = (known after apply)
      + subnetwork                  = (known after apply)
      + tpu_ipv4_cidr_block         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cluster_endpoint = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_container_cluster.autopilot: Creating...
google_container_cluster.autopilot: Still creating... [10s elapsed]
google_container_cluster.autopilot: Still creating... [20s elapsed]
google_container_cluster.autopilot: Still creating... [30s elapsed]
google_container_cluster.autopilot: Still creating... [40s elapsed]
google_container_cluster.autopilot: Still creating... [50s elapsed]
google_container_cluster.autopilot: Still creating... [1m0s elapsed]
google_container_cluster.autopilot: Still creating... [1m10s elapsed]
google_container_cluster.autopilot: Still creating... [1m20s elapsed]
google_container_cluster.autopilot: Still creating... [1m30s elapsed]
google_container_cluster.autopilot: Still creating... [1m40s elapsed]
google_container_cluster.autopilot: Still creating... [1m50s elapsed]
google_container_cluster.autopilot: Still creating... [2m0s elapsed]
google_container_cluster.autopilot: Still creating... [2m10s elapsed]
google_container_cluster.autopilot: Still creating... [2m20s elapsed]
google_container_cluster.autopilot: Still creating... [2m30s elapsed]
google_container_cluster.autopilot: Still creating... [2m40s elapsed]
google_container_cluster.autopilot: Still creating... [2m50s elapsed]
google_container_cluster.autopilot: Still creating... [3m0s elapsed]
google_container_cluster.autopilot: Still creating... [3m10s elapsed]
google_container_cluster.autopilot: Still creating... [3m20s elapsed]
google_container_cluster.autopilot: Still creating... [3m30s elapsed]
google_container_cluster.autopilot: Still creating... [3m40s elapsed]
google_container_cluster.autopilot: Still creating... [3m50s elapsed]
google_container_cluster.autopilot: Still creating... [4m0s elapsed]
google_container_cluster.autopilot: Still creating... [4m10s elapsed]
google_container_cluster.autopilot: Still creating... [4m20s elapsed]
google_container_cluster.autopilot: Still creating... [4m30s elapsed]
google_container_cluster.autopilot: Still creating... [4m40s elapsed]
google_container_cluster.autopilot: Still creating... [4m50s elapsed]
google_container_cluster.autopilot: Still creating... [5m0s elapsed]
google_container_cluster.autopilot: Still creating... [5m10s elapsed]
google_container_cluster.autopilot: Still creating... [5m20s elapsed]
google_container_cluster.autopilot: Still creating... [5m30s elapsed]
google_container_cluster.autopilot: Still creating... [5m40s elapsed]
google_container_cluster.autopilot: Still creating... [5m50s elapsed]
google_container_cluster.autopilot: Still creating... [6m0s elapsed]
google_container_cluster.autopilot: Still creating... [6m10s elapsed]
google_container_cluster.autopilot: Still creating... [6m20s elapsed]
google_container_cluster.autopilot: Still creating... [6m30s elapsed]
google_container_cluster.autopilot: Still creating... [6m40s elapsed]
google_container_cluster.autopilot: Still creating... [6m50s elapsed]
google_container_cluster.autopilot: Still creating... [7m0s elapsed]
google_container_cluster.autopilot: Still creating... [7m10s elapsed]
google_container_cluster.autopilot: Still creating... [7m20s elapsed]
google_container_cluster.autopilot: Still creating... [7m30s elapsed]
google_container_cluster.autopilot: Still creating... [7m40s elapsed]
google_container_cluster.autopilot: Still creating... [7m50s elapsed]
google_container_cluster.autopilot: Still creating... [8m0s elapsed]
google_container_cluster.autopilot: Creation complete after 8m4s [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

cluster_endpoint = "34.76.141.230"
Lazlo@my-machine terraform-gke % gcloud container clusters get-credentials  autopilot-cluster-1 --region=europe-west1
Fetching cluster endpoint and auth data.
kubeconfig entry generated for autopilot-cluster-1.

## Creating a Service of type ClusterIP

Lazlo@my-machine terraform-gke % cd ../kubernetes 
Lazlo@my-machine kubernetes % kubectl apply -f my-deployment.yaml
E0211 19:00:08.722399   13967 memcache.go:287] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
E0211 19:00:08.834901   13967 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
Warning: autopilot-default-resources-mutator:Autopilot updated Deployment default/my-deployment: defaulted unspecified resources for containers [hello] (see http://g.co/gke/autopilot-defaults)
deployment.apps/my-deployment created
Lazlo@my-machine kubernetes % kubectl get pods
E0211 19:02:46.597738   14049 memcache.go:287] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
E0211 19:02:46.632175   14049 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
E0211 19:02:46.759850   14049 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
E0211 19:02:46.802395   14049 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-7866d98dbb-2qs65   1/1     Running   0          2m37s
my-deployment-7866d98dbb-5njpp   1/1     Running   0          2m37s
my-deployment-7866d98dbb-sqwzm   1/1     Running   0          2m37s
Lazlo@my-machine kubernetes % kubectl apply -f my-cip-service.yaml
service/my-cip-service created
Lazlo@my-machine kubernetes % kubectl get service my-cip-service --output yaml|grep "clusterIP:" 
  clusterIP: 34.118.230.195

## Accessing your Service

Lazlo@my-machine kubernetes % kubectl get pods
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-7866d98dbb-2qs65   1/1     Running   0          5m33s
my-deployment-7866d98dbb-5njpp   1/1     Running   0          5m33s
my-deployment-7866d98dbb-sqwzm   1/1     Running   0          5m33s
Lazlo@my-machine kubernetes % kubectl exec -it my-deployment-7866d98dbb-2qs65 -- sh
error: Internal error occurred: error executing command in container: failed to exec in container: failed to start exec "7ad780fd893258cde9891b15d7e47b9e1d708cbd6ac1b96bec55390041b906d9": OCI runtime exec failed: exec failed: unable to start container process: exec: "sh": executable file not found in $PATH: unknown
Lazlo@my-machine kubernetes % kubectl exec -it my-deployment-7866d98dbb-2qs65 -- /bin/sh
error: Internal error occurred: error executing command in container: failed to exec in container: failed to start exec "ad83fb94aa77d5751758d1df00f1b4941243aa63cee1d22c74e94d8d5219a869": OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/sh": stat /bin/sh: no such file or directory: unknown
Lazlo@my-machine kubernetes % kubectl exec -it my-deployment-7866d98dbb-2qs65 /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
error: Internal error occurred: error executing command in container: failed to exec in container: failed to start exec "c5c2c764990eeeb322dd910aa5447d1b544e49b6173f5bac5f051ca2380314e9": OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/bash": stat /bin/bash: no such file or directory: unknown

## Creating a Service of type NodePort

Lazlo@my-machine kubernetes % kubectl apply -f my-deployment-50000.yaml                  
Warning: autopilot-default-resources-mutator:Autopilot updated Deployment default/my-deployment-50000: defaulted unspecified resources for containers [hello] (see http://g.co/gke/autopilot-defaults)
deployment.apps/my-deployment-50000 created
Lazlo@my-machine kubernetes % kubectl get pods
NAME                                  READY   STATUS    RESTARTS   AGE
my-deployment-50000-8876fb655-77x5p   1/1     Running   0          2m15s
my-deployment-50000-8876fb655-977nx   1/1     Running   0          2m15s
my-deployment-50000-8876fb655-x59rd   1/1     Running   0          2m15s
my-deployment-7866d98dbb-2qs65        1/1     Running   0          25m
my-deployment-7866d98dbb-5njpp        1/1     Running   0          25m
my-deployment-7866d98dbb-sqwzm        1/1     Running   0          25m
Lazlo@my-machine kubernetes % kubectl apply -f my-np-service.yaml
service/my-np-service created
Lazlo@my-machine kubernetes % kubectl get service my-np-service --output yaml |grep "nodePort"
  - nodePort: 30120
Lazlo@my-machine kubernetes % gcloud compute firewall-rules create test-node-port --allow tcp:30120
Creating firewall...⠹Created [https://www.googleapis.com/compute/v1/projects/gcp-terraform2/global/firewalls/test-node-port].                                            
Creating firewall...done.                                                                                                                                                
NAME            NETWORK  DIRECTION  PRIORITY  ALLOW      DENY  DISABLED
test-node-port  default  INGRESS    1000      tcp:30120        False

## Get a node IP address

Lazlo@my-machine kubernetes % kubectl get nodes --output wide
NAME                                           STATUS   ROLES    AGE     VERSION               INTERNAL-IP   EXTERNAL-IP     OS-IMAGE                             KERNEL-VERSION   CONTAINER-RUNTIME
gk3-autopilot-cluster-1-pool-2-6cff7a0b-zppm   Ready    <none>   27m     v1.27.8-gke.1067004   10.132.0.9    34.22.167.89    Container-Optimized OS from Google   5.15.133+        containerd://1.7.10
gk3-autopilot-cluster-1-pool-2-8d0b9162-bjpc   Ready    <none>   27m     v1.27.8-gke.1067004   10.132.0.8    34.38.180.139   Container-Optimized OS from Google   5.15.133+        containerd://1.7.10
gk3-autopilot-cluster-1-pool-2-8d53d5d2-9nxq   Ready    <none>   4m19s   v1.27.8-gke.1067004   10.132.0.10   34.78.110.254   Container-Optimized OS from Google   5.15.133+        containerd://1.7.10

## Access your Service

Lazlo@my-machine kubernetes % curl http://34.22.167.89:30120/
Hello, world!
Version: 2.0.0
Hostname: my-deployment-50000-8876fb655-x59rd

## Creating a Service of type LoadBalancer

Lazlo@my-machine kubernetes % kubectl apply -f my-deployment-50001.yaml
Warning: autopilot-default-resources-mutator:Autopilot updated Deployment default/my-deployment-50001: defaulted unspecified resources for containers [hello] (see http://g.co/gke/autopilot-defaults)
deployment.apps/my-deployment-50001 created
Lazlo@my-machine kubernetes % kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
my-deployment-50000-8876fb655-77x5p    1/1     Running   0          9m58s
my-deployment-50000-8876fb655-977nx    1/1     Running   0          9m58s
my-deployment-50000-8876fb655-x59rd    1/1     Running   0          9m58s
my-deployment-50001-6655d5b5f4-gb5v8   1/1     Running   0          2m1s
my-deployment-50001-6655d5b5f4-rcst2   1/1     Running   0          2m1s
my-deployment-50001-6655d5b5f4-vc66r   1/1     Running   0          2m1s
my-deployment-7866d98dbb-2qs65         1/1     Running   0          33m
my-deployment-7866d98dbb-5njpp         1/1     Running   0          33m
my-deployment-7866d98dbb-sqwzm         1/1     Running   0          33m
Lazlo@my-machine kubernetes % kubectl apply -f my-lb-service.yaml
service/my-lb-service created
Lazlo@my-machine kubernetes % kubectl get service my-lb-service --output yaml |grep "ip:"
    - ip: 34.79.145.36

## Access your Service

Lazlo@my-machine kubernetes % curl http://34.79.145.36:60000  
Hello, world!
Version: 2.0.0
Hostname: my-deployment-50001-6655d5b5f4-gb5v8

## Cleaning up

Lazlo@my-machine kubernetes % kubectl delete services my-cip-service my-np-service my-lb-service
service "my-cip-service" deleted
service "my-np-service" deleted
service "my-lb-service" deleted
Lazlo@my-machine kubernetes % kubectl delete deployments my-deployment my-deployment-50000 my-deployment-50001
deployment.apps "my-deployment" deleted
deployment.apps "my-deployment-50000" deleted
deployment.apps "my-deployment-50001" deleted
Lazlo@my-machine kubernetes % gcloud compute firewall-rules delete test-node-port
The following firewalls will be deleted:
 - [test-node-port]

Do you want to continue (Y/n)?  

Deleted [https://www.googleapis.com/compute/v1/projects/gcp-terraform2/global/firewalls/test-node-port].
Lazlo@my-machine kubernetes % cd ../terraform-gke 
Lazlo@my-machine terraform-gke % terraform destroy
google_container_cluster.autopilot: Refreshing state... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # google_container_cluster.autopilot will be destroyed
  - resource "google_container_cluster" "autopilot" {
      - cluster_ipv4_cidr           = "10.40.128.0/17" -> null
      - datapath_provider           = "ADVANCED_DATAPATH" -> null
      - default_max_pods_per_node   = 110 -> null
      - deletion_protection         = false -> null
      - enable_autopilot            = true -> null
      - enable_intranode_visibility = true -> null
      - enable_kubernetes_alpha     = false -> null
      - enable_l4_ilb_subsetting    = false -> null
      - enable_legacy_abac          = false -> null
      - enable_shielded_nodes       = true -> null
      - enable_tpu                  = false -> null
      - endpoint                    = "34.76.141.230" -> null
      - id                          = "projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1" -> null
      - initial_node_count          = 0 -> null
      - label_fingerprint           = "a9dc16a7" -> null
      - location                    = "europe-west1" -> null
      - logging_service             = "logging.googleapis.com/kubernetes" -> null
      - master_version              = "1.27.8-gke.1067004" -> null
      - monitoring_service          = "monitoring.googleapis.com/kubernetes" -> null
      - name                        = "autopilot-cluster-1" -> null
      - network                     = "projects/gcp-terraform2/global/networks/default" -> null
      - networking_mode             = "VPC_NATIVE" -> null
      - node_locations              = [
          - "europe-west1-b",
          - "europe-west1-c",
          - "europe-west1-d",
        ] -> null
      - node_version                = "1.27.8-gke.1067004" -> null
      - project                     = "gcp-terraform2" -> null
      - resource_labels             = {} -> null
      - self_link                   = "https://container.googleapis.com/v1/projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1" -> null
      - services_ipv4_cidr          = "34.118.224.0/20" -> null
      - subnetwork                  = "projects/gcp-terraform2/regions/europe-west1/subnetworks/default" -> null

      - addons_config {
          - dns_cache_config {
              - enabled = true -> null
            }
          - gce_persistent_disk_csi_driver_config {
              - enabled = true -> null
            }
          - gcp_filestore_csi_driver_config {
              - enabled = true -> null
            }
          - gcs_fuse_csi_driver_config {
              - enabled = true -> null
            }
          - network_policy_config {
              - disabled = true -> null
            }
        }

      - binary_authorization {
          - enabled = false -> null
        }

      - cluster_autoscaling {
          - autoscaling_profile = "OPTIMIZE_UTILIZATION" -> null
          - enabled             = true -> null

          - auto_provisioning_defaults {
              - disk_size       = 0 -> null
              - image_type      = "COS_CONTAINERD" -> null
              - oauth_scopes    = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - service_account = "default" -> null

              - management {
                  - auto_repair     = true -> null
                  - auto_upgrade    = true -> null
                  - upgrade_options = [] -> null
                }

              - upgrade_settings {
                  - max_surge       = 1 -> null
                  - max_unavailable = 0 -> null
                  - strategy        = "SURGE" -> null
                }
            }

          - resource_limits {
              - maximum       = 1000000000 -> null
              - minimum       = 0 -> null
              - resource_type = "cpu" -> null
            }
          - resource_limits {
              - maximum       = 1000000000 -> null
              - minimum       = 0 -> null
              - resource_type = "memory" -> null
            }
          - resource_limits {
              - maximum       = 1000000000 -> null
              - minimum       = 0 -> null
              - resource_type = "nvidia-tesla-t4" -> null
            }
          - resource_limits {
              - maximum       = 1000000000 -> null
              - minimum       = 0 -> null
              - resource_type = "nvidia-tesla-a100" -> null
            }
        }

      - database_encryption {
          - state = "DECRYPTED" -> null
        }

      - default_snat_status {
          - disabled = false -> null
        }

      - dns_config {
          - cluster_dns        = "CLOUD_DNS" -> null
          - cluster_dns_domain = "cluster.local" -> null
          - cluster_dns_scope  = "CLUSTER_SCOPE" -> null
        }

      - gateway_api_config {
          - channel = "CHANNEL_STANDARD" -> null
        }

      - ip_allocation_policy {
          - cluster_ipv4_cidr_block      = "10.40.128.0/17" -> null
          - cluster_secondary_range_name = "gke-autopilot-cluster-1-pods-15a05018" -> null
          - services_ipv4_cidr_block     = "34.118.224.0/20" -> null
          - stack_type                   = "IPV4" -> null

          - pod_cidr_overprovision_config {
              - disabled = false -> null
            }
        }

      - logging_config {
          - enable_components = [
              - "SYSTEM_COMPONENTS",
              - "WORKLOADS",
            ] -> null
        }

      - master_auth {
          - cluster_ca_certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUVMVENDQXBXZ0F3SUJBZ0lSQU9NdUE4SXduZlZ4NW1OTzU1RUs5L0F3RFFZSktvWklodmNOQVFFTEJRQXcKTHpFdE1Dc0dBMVVFQXhNa01HTTNORFU0TmpJdFkyVmxNUzAwTldNeExUazBZbVl0TVRsak1Ua3hNV0ZtTVRNeQpNQ0FYRFRJME1ESXhNVEUyTkRRMU1Wb1lEekl3TlRRd01qQXpNVGMwTkRVeFdqQXZNUzB3S3dZRFZRUURFeVF3Cll6YzBOVGcyTWkxalpXVXhMVFExWXpFdE9UUmlaaTB4T1dNeE9URXhZV1l4TXpJd2dnR2lNQTBHQ1NxR1NJYjMKRFFFQkFRVUFBNElCandBd2dnR0tBb0lCZ1FDdHpBK2tyeEU1Q1JMaXJTZGhjSll1YTN3QXpoeVVvVkcvOHovcApBTm9zR0oyN2IwZWIrL1V6NnViTVRVUFdpYVNVWHBvbWVWdm43eSs5WGtwOUYzQXZvZ2JpR2UvNnI2dmRremhpCkhnL0dUZkJNMERCRWcwZFJ5MnNtZ1UxNXlWUy9OQ3lHRnZhMUg1SCtYSFdqZ0NXWnA0aFMrcnNkaHY1Q3JsRGEKQWdiTCt6d0crREVLeEw3WW9rZHgrdDB6TlNjMXFaM2hhWE9UMURMZUMyZTBSZGhOR3lLbW9JY1lQVng0VHRHegp0MXVFRUJTSml5VjY1OUh1VlYxWnJBaWl2dWFjTy9zeVM3TTF2R29vM2hxSVZRdm9Zc25ZTnlkYjJ3YkpXKzhYCkhneWYvd2RIU2NMUE5ZQkw2QytqNEhlUHgwSWlHMW1Ja1dza1FWdTQzWXNlV0wwRGdIUDZUUE50c0xsRHQvQWoKNkpaV3Y1MXZDcUpoZ1hvdklCMllnQmZyczlpMXdaUE9TRlRVbzhBOWtTUTJBT0s2VFRtSGl3ZE9QYmxzM0pMYgpIY1dkdEVxNC8zSGwrWmJRNngzeWs4aStNWStPVEtod1NyeXVBZTMvaHZSTWZrVVBHRm9UYUJIVVlsWk1lNk5PCldyRmR5d3NqRGJpYjhuTkF3Q3BJNER3NzVPMENBd0VBQWFOQ01FQXdEZ1lEVlIwUEFRSC9CQVFEQWdJRU1BOEcKQTFVZEV3RUIvd1FGTUFNQkFmOHdIUVlEVlIwT0JCWUVGRVZZKzB2VU5GSFJOVHhBWDZxaW9PSS9kVDhYTUEwRwpDU3FHU0liM0RRRUJDd1VBQTRJQmdRQ1d4OGN6MHhCNDNxTHZ2QnM4ZEdtN0wyVlVNRmdyam5mbC83NWtmT1B2CmFzT1dzUnJmZmZGQ20rOURpRHdseDl3MWJzTjNpclBjODl4QnpiaEh0WW9ub3QzQlJXWkZQa05KMTNOR29uZGYKSFJlWTF2QUVkcm5kUk5wRlFFL0g2S1hsb2orcGdvSitHVlZFUXZTK2s5S2dCRnIzUDRERGRUeXdWOERiM1A2Qwp0b25QMnY1WmZGMHljR21yY3VoNFlXdkVyekREMmFTdCtzdGZkKzdJa3BQbjVvU2F6bEJBLzdVanRHV0gwcFVtCklzV0k0S3RyYUkreGZHWDcxbmxTbk5yaldJNGhDMGtKNVJlamYvSVZhZStrV1lBR1hYVzNpWU9HKzFQRDVqcFgKSXlBUGpmQ1pNOUZScW1ZcmdQSnFkbXQ3UnkzVDI0UGVlQTM1bzNxckcyRThSbDNsVnZIaTBtemJTbUE5OVUzZgpUcDE1TDA0NUprdlkreENpQTNIYkNnNlNBbU8va1RmWXNkcEZCWWFEY1J4MUJOaXljZlVxMjJRMzRnbkdaQytICmJ3c0tRMUJnV0NBL2EwUVBCZWZpOHQ2bERkSit4L1BLaU1JcGlGYXlUQmFIU1EzNDFqck1HRGpNQXdHb2ZmRTEKN3dydFIyY1Y4OU10S3pWSEF2V29JTzg9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K" -> null

          - client_certificate_config {
              - issue_client_certificate = false -> null
            }
        }

      - monitoring_config {
          - enable_components = [
              - "SYSTEM_COMPONENTS",
              - "POD",
              - "DAEMONSET",
              - "DEPLOYMENT",
              - "STATEFULSET",
              - "STORAGE",
              - "HPA",
            ] -> null

          - advanced_datapath_observability_config {
              - enable_metrics = true -> null
            }

          - managed_prometheus {
              - enabled = true -> null
            }
        }

      - network_policy {
          - enabled  = false -> null
          - provider = "PROVIDER_UNSPECIFIED" -> null
        }

      - node_config {
          - disk_size_gb      = 100 -> null
          - disk_type         = "pd-balanced" -> null
          - effective_taints  = [
              - {
                  - effect = "NO_SCHEDULE"
                  - key    = "cloud.google.com/gke-quick-remove"
                  - value  = "true"
                },
            ] -> null
          - guest_accelerator = [] -> null
          - image_type        = "COS_CONTAINERD" -> null
          - labels            = {} -> null
          - local_ssd_count   = 0 -> null
          - logging_variant   = "DEFAULT" -> null
          - machine_type      = "e2-small" -> null
          - metadata          = {
              - "disable-legacy-endpoints" = "true"
            } -> null
          - oauth_scopes      = [
              - "https://www.googleapis.com/auth/devstorage.read_only",
              - "https://www.googleapis.com/auth/logging.write",
              - "https://www.googleapis.com/auth/monitoring",
              - "https://www.googleapis.com/auth/service.management.readonly",
              - "https://www.googleapis.com/auth/servicecontrol",
              - "https://www.googleapis.com/auth/trace.append",
            ] -> null
          - preemptible       = false -> null
          - resource_labels   = {} -> null
          - service_account   = "default" -> null
          - spot              = false -> null
          - tags              = [] -> null

          - reservation_affinity {
              - consume_reservation_type = "NO_RESERVATION" -> null
              - values                   = [] -> null
            }

          - shielded_instance_config {
              - enable_integrity_monitoring = true -> null
              - enable_secure_boot          = true -> null
            }

          - workload_metadata_config {
              - mode = "GKE_METADATA" -> null
            }
        }

      - node_pool {
          - initial_node_count          = 1 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "default-pool" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [
                  - {
                      - effect = "NO_SCHEDULE"
                      - key    = "cloud.google.com/gke-quick-remove"
                      - value  = "true"
                    },
                ] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-small" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-1" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-medium" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-2" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-standard-2" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-3" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-standard-4" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-4" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-standard-8" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-5" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-standard-16" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }
      - node_pool {
          - initial_node_count          = 0 -> null
          - instance_group_urls         = [] -> null
          - managed_instance_group_urls = [] -> null
          - max_pods_per_node           = 32 -> null
          - name                        = "pool-6" -> null
          - node_count                  = 0 -> null
          - node_locations              = [
              - "europe-west1-b",
              - "europe-west1-c",
              - "europe-west1-d",
            ] -> null
          - version                     = "1.27.8-gke.1067004" -> null

          - autoscaling {
              - location_policy      = "BALANCED" -> null
              - max_node_count       = 1000 -> null
              - min_node_count       = 0 -> null
              - total_max_node_count = 0 -> null
              - total_min_node_count = 0 -> null
            }

          - management {
              - auto_repair  = true -> null
              - auto_upgrade = true -> null
            }

          - network_config {
              - create_pod_range     = false -> null
              - enable_private_nodes = false -> null
              - pod_ipv4_cidr_block  = "10.40.128.0/17" -> null
              - pod_range            = "gke-autopilot-cluster-1-pods-15a05018" -> null
            }

          - node_config {
              - disk_size_gb      = 100 -> null
              - disk_type         = "pd-balanced" -> null
              - effective_taints  = [] -> null
              - guest_accelerator = [] -> null
              - image_type        = "COS_CONTAINERD" -> null
              - labels            = {} -> null
              - local_ssd_count   = 0 -> null
              - logging_variant   = "DEFAULT" -> null
              - machine_type      = "e2-standard-32" -> null
              - metadata          = {
                  - "disable-legacy-endpoints" = "true"
                } -> null
              - oauth_scopes      = [
                  - "https://www.googleapis.com/auth/devstorage.read_only",
                  - "https://www.googleapis.com/auth/logging.write",
                  - "https://www.googleapis.com/auth/monitoring",
                  - "https://www.googleapis.com/auth/service.management.readonly",
                  - "https://www.googleapis.com/auth/servicecontrol",
                  - "https://www.googleapis.com/auth/trace.append",
                ] -> null
              - preemptible       = false -> null
              - resource_labels   = {} -> null
              - service_account   = "default" -> null
              - spot              = false -> null
              - tags              = [] -> null

              - reservation_affinity {
                  - consume_reservation_type = "NO_RESERVATION" -> null
                  - values                   = [] -> null
                }

              - shielded_instance_config {
                  - enable_integrity_monitoring = true -> null
                  - enable_secure_boot          = true -> null
                }

              - workload_metadata_config {
                  - mode = "GKE_METADATA" -> null
                }
            }

          - upgrade_settings {
              - max_surge       = 1 -> null
              - max_unavailable = 0 -> null
              - strategy        = "SURGE" -> null
            }
        }

      - node_pool_defaults {
          - node_config_defaults {
              - logging_variant = "DEFAULT" -> null
            }
        }

      - notification_config {
          - pubsub {
              - enabled = false -> null
            }
        }

      - private_cluster_config {
          - enable_private_endpoint = false -> null
          - enable_private_nodes    = false -> null
          - private_endpoint        = "10.132.0.6" -> null
          - public_endpoint         = "34.76.141.230" -> null

          - master_global_access_config {
              - enabled = false -> null
            }
        }

      - release_channel {
          - channel = "REGULAR" -> null
        }

      - security_posture_config {
          - mode               = "BASIC" -> null
          - vulnerability_mode = "VULNERABILITY_BASIC" -> null
        }

      - service_external_ips_config {
          - enabled = false -> null
        }

      - vertical_pod_autoscaling {
          - enabled = true -> null
        }

      - workload_identity_config {
          - workload_pool = "gcp-terraform2.svc.id.goog" -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - cluster_endpoint = "34.76.141.230" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

google_container_cluster.autopilot: Destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 10s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 20s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 30s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 40s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 50s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m0s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m10s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m20s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m30s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m40s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 1m50s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m0s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m10s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m20s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m30s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m40s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 2m50s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 3m0s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 3m10s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 3m20s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 3m30s elapsed]
google_container_cluster.autopilot: Still destroying... [id=projects/gcp-terraform2/locations/europe-west1/clusters/autopilot-cluster-1, 3m40s elapsed]
google_container_cluster.autopilot: Destruction complete after 3m42s

Destroy complete! Resources: 1 destroyed.
