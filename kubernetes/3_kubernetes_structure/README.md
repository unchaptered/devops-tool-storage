[< Backaward](../README.md)

# Kubernetes Structure

## Element of Kubernetes

- `api` : The "api" is the central control plane component that manages all operations within a kubernetes cluster. You can handle resource to create, modify, search using "api".
- `etcd` : The "etcd" is the central storage of kubernetes cluster. You can save and administrate cluster status(or setting configuration).
- `cm-m` : The "cm-m(Control Manager)" is kubernetes controller to administrate each resources of cluster-level resources.
- `sched` : The "sched" is responsible for selecting the nodes on which new Pods will run within the cluster. 
- `coreDNS` : The "coreDNS" is responsible for providing DNS services within a kubernetes cluster.
- `k-proxy` : The "k-proxy" manages the kubernetes service abstraction and performs network traffic load balancing between pods.
- `cni` : The "cni" is shortcut of container network interface. "cni" is a plugin-based networking interfce for the kubernetes network model. It enables network communication between pods.
- `kubelet` : The "kubelet" is an agent running on each node that creates and manages the pods on the node, and reports the node state to the kubernetes API Server.

## Namespace

I deployed today, the resources are deployed in the **default namespace**.
However, most of the labs and courses exists in a place called **kube-system**.
It means that the MetalLb we used in [First Basic kubernetes](../1_basic_kubernetes/README.md) exists in a place called metallb-system.
And many of the [Elements of Kubernetes](./README.md#element-of-kubernetes) are in a place called kube-system. You can check using `kubectl get pods -n <NAMESPCE_NAME>`.

```shell
cd  ~/kubernetes/1_basic_kubernetes

vagrant global-status

vagrant ssh m-k8s-1.25.0

kubectl get pods -n kube-system
# [root@m-k8s vagrant]# kubectl get pods -n kube-system
# NAME                                       READY   STATUS    RESTARTS       AGE
# calico-kube-controllers-6856fc6d6c-kv778   1/1     Running   2 (74m ago)    19h
# calico-node-5fbfc                          1/1     Running   10 (74m ago)   19h
# calico-node-lbv6z                          1/1     Running   2 (67m ago)    18h
# calico-node-rjwq2                          1/1     Running   2 (77m ago)    19h
# coredns-565d847f94-6ptx9                   1/1     Running   2 (77m ago)    19h
# coredns-565d847f94-f9mzj                   1/1     Running   2 (77m ago)    19h
# etcd-m-k8s                                 1/1     Running   2 (77m ago)    19h
# kube-apiserver-m-k8s                       1/1     Running   2 (77m ago)    19h
# kube-controller-manager-m-k8s              1/1     Running   5 (77m ago)    19h
# kube-proxy-6tb26                           1/1     Running   2 (77m ago)    19h
# kube-proxy-7gc6p                           1/1     Running   2 (74m ago)    19h
# kube-proxy-wwpm4                           1/1     Running   2 (67m ago)    18h
# kube-scheduler-m-k8s                       1/1     Running   5 (77m ago)    19h
```

## AWS EKS / Azure AKS / Google GKE

Both "AWS EKS" and "Azure AKS" look similar with [Namepsace](./README.md#namespace).

## Kubernetes Fundamental Philosophy - MSA : Microservices Architecture

In this chatper, I'll abbreviate master node as `mn` and worker node as `wn`

Most elements of kubernetes are responsible for doing their own thing.
Each link is loosely coupled in a "declarative way".
This is the fundamental view of kubernetes, implemented in the MSA way.

1. Client -> `api`:`mn`,
2. Create Pod    
    1. `api`:`mn` -> `c-m`:`mn` - monitoring for changing
    2. `c-m`:`mn` -> `api`:`mn`
3. Insert pod into worker node
    1. `api`:`mn` -> `sched`:`mn` - monitoring for changing
    2. `sched`:`mn` -> `api`:`mn`
4. Insert pod is included in worker node.
    1. `api`:`mn` -> `kubelet`:`wn` - monitoring for changing
    3. `kubelet`:`wn` -> `api`:`mn`
5. Manage action of pods and then, create container for pod, deploy, rs and so on.

## Kubernetes Declarative Systems

- Trying to match current status with desire status.
    - **[AS-IS]** Desire Status != Current Status
    - **[TO-BE]** Desire Status == Current Status

- **Process of change status**.
    1. Monitoring
    2. Diff
    3. Change status

## Speciality of `api` and `etcd`.

For the most part, kubernetes internals work in a declarative way.
However, kubernetes' `api` and `etcd` work in a traditional programmatic way.

1. `api` record to `etc` manually.
    1. (In each) `api` record the changes of cluster to `etcd`
    2. (In each) `etcd` send a response to `api` that update is success or failure.
