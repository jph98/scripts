# Managing Kubernetes

See - https://www.oreilly.com/library/view/managing-kubernetes/9781492033905/

## Chapter 1
Orchestration for containerized apps

Metrics:
* Baseline Metrics - O/S level metrics
* Application Metrics - exposed in a Prometheus format

Playbooks - How to repair the service

Spinnaker/Jenkins - CI

Helm - package and deploy
Deis - Git push workflows
FaaS platforms built on top of Kubernetes

Dynamic add/removal of API's

## Chapter 2

Namespace - process isolation for the container
* chroot filesystem, PID, network
* can use selinux with running containers

Image format standardized - OCI

Image registry - public and private

Kubernetes - take group of machines and transform them into a container API for developers
* 3 cores, 10GB
* Knows how to heal containers
* Can define custom health checks
* API objects for load balancing for containers
* Objects for zero downtime deployments

API is REST and JSON based

Pod
* Basic unit of scheduling (collection of containers).  
* All visible on the same machine. Unit of scaling and 
* Unit of scaling and replication is important here
* Can define application level health checks

ReplicaSets
* Ensures that a number of replicas exist
* Kubernetes controller manager creates Pod objects.  Kubernetes scheduler looks after the scheduling.

Services
* TCP or UDP balanced load balanced service
* Every service gets a IP Address, DNS Entry in the Kube cluster DNS, load balancing rules to proxy traffic
* Virtual IP address
* Load balanced (possibly robin or deterministic)

Volume
* Within a pod there are volumes
* ConfigMap - collection of config files
* PersistentVolume - binds a pod to a volume using a PersistentVolumeClaim

Namespaces
* Folder for API objects
* Role based access control
* default Namespace
* kube-system Namespace
* my-service.svc.my- namespace.cluster.internal

Labels
* Every object can have a set of labels (key, value pair)
* e.g. Get all pods with the backend label
* Label queries and selectors

Annotations
* Arbritary metadata attached

Deployments
* Pointers to multiple replica sets
* Control safe migration

Ingress
* Path and Host based HTTP load balancer and router
* Create this > get a virtual IP.
* Instead of Service IP > Pods you can route based on the content of a HTTP request
* https://kubernetes.io/docs/concepts/services-networking/ingress/

StatefulSets
* Replicaset > name is a random hash
* StatefulSet > Each replica here gets a monotonically increasing number
* https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/

Batch Workloads
* Batch or one time
* Job represents a set of tasks to run
* Job contains definition of the Pods created, number of times to run, max number of Pods to create in parallel
* ScheduledJobs build on top of this - https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/

DaemonSets
* Agents are not included in the resources if systemd or an alternative is used
* This is useful for intrusion detection etc...
* DaemonSet is a template for a Pod that should run on each machine
* Can selectively include which pods run where

## Chapter Three
