## Basics

Each project is a billing account
Permissions and credentials
Cloud Resource Manager API

Cloud IAM - curated roles:
* compute.instances.start
* Groups as well as individuals
* Owner roles trump individual restrictions
* Organisation Roles (Admin, Project Creator)
* Service accounts - server to server
* OAuth 2.0 

IaaS - towards devops
PaaS - towards noops

## App Engine

App Engine - Java, Python, PHP and Go
* Autoscaling built in

App Engine Flexible Environments - custom containers for whatever language (C#)
* Compute Engine VM's - Docker

Standard Runtimes - No SSH access, no support outside standard binaries (noops)

Google Cloud Endpoints:
* RESTful API's for services
* https://cloud.google.com/endpoints/
* Java and Python

Cloud Datastore: NOSQL Database
* Objects and Entities
* Schemaless
* ACID

App Components:
* main.py - main app component
* crud.py - controller layer (binds http to persistent objects)
* config.py - project config
* appengine_config.py - 
* model_datastore.py - 
* model_cloudsql.py - persistence code 

Deploying your app:
* Based on Flask
* gcloud app deploy
* gcloud app logs tail -s default
* gcloud app browse

## Storage Options 

Cloud Storage
* Data encrypted in-flight and at rest
* Standard
* DRA (lower SLA and cheaper)
* Nearline Storage (lowcost, archiving)
* Regional, Versioned, Offline Import
* ACL's, Lifecycle, Online Cloud Import, Object Change Notifications
* PB

Cloud Datastore:
* Good for getting started, AppEng apps
* User profiles, product catalog
* TB

Bigtable:
* Flat data
* Heavy read/write
* Adtech
* Gmail and Analytics use this
* App API, Streaming, Batch
* No transactions or complex queries

CloudSQL
* Webapps, standard MySQL
* Good for orders
* Up to 500GB 

## Container Engine

* Virt at the OS layer
* Docker and rkt are solutions here
* Consistency, loose coupling

Kube - container orchestration
* Manages deployment and scaling
* Rolling updates
* Load balancing

Compute options:
* Compute Engine (IaaS)
* Container Engine
* App Engine Standard and Flexible (PaaS)

Cloud Container Builder - registry (like ECR)

Kubernetes:
* Schedules containers into a cluster
* Use kubectl to scale
* Node - worker machine (Compute Engine Instance)
* Pod - group of one or more containers
* Replication Controllers - manages pod replicas
* Services - set of pods (IP:port)

Docker image is hosted on Google Container Registry

```
gcloud config set compute/zone europe-west1-d
```

Run config list to get an overview of the current settings:

```
gcloud config list
```

Create a cluster, specifying scope for Kubernetes in terms of access to other components:

```
gcloud container clusters create bookshelf --scopes "https://www.googleapis.com/auth/userinfo.email","cloud-platform" --num-nodes 2
```

Then publish our project to the Kubernetes cluster. n.b. The use of the current project id env var here. Build the container:

```
sed -i s/your-project-id/$DEVSHELL_PROJECT_ID/ config.py
sed -i s/your-project-id/$DEVSHELL_PROJECT_ID/ bookshelf-frontend.yaml
docker build -t gcr.io/$DEVSHELL_PROJECT_ID/bookshelf .
gcloud docker -- push gcr.io/$DEVSHELL_PROJECT_ID/bookshelf
gcloud container clusters get-credentials bookshelf
kubectl create -f bookshelf-frontend.yaml
```

Check the status of our pods:

```
kubectl get pods
kubectl get services bookshelf-frontend
```

or a specific pod:

```
kubectl get pods bookshelf-frontend-9flq7
```

## Compute Engine Networking

* Custom Networking
* SSD, local SSD
* Snapshots
* Instance Metadata and Startup Scripts
* Per minute billing
* Pre-emptible instances

Google Cloud Internetworking - connect your business
* Carrier Interconnect - enterprise grade
* Direct peering - connnect your business
* CDN Interconnect - CDN providers to allow direct links to edge

Cloud VPN - connect to Google
Cloud DNS - DNS provider
Cloud Load Balancer - TCP, UDP, HTTP/HTTPS
* Some region restrictions here

Cloud Deployment Manager - templates for environments

Cloud Functions
