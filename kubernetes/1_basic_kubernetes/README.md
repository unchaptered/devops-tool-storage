[< Backaward](../README.md)

# Basic Kubernetes

[Origin Vagrant File](../sample_repo/ch1/1.2/k8s-min-5GiB/Vagrantfile)


```shell
##################
# [Host Machine] #
##################

vagrant init
vagrant validate
vagrant up
vagrant destroy <NAME\>
vagrant provision <NAME\>

vagrant global-status
vagrant ssh <VIRTUAL_MACHINE_NAME>
```

## 1. Nodes

```shell
#######################
# [Kubernetes Server] #
#######################

kubectl get nodes
# [root@m-k8s vagrant]# kubectl get nodes
# NAME     STATUS   ROLES           AGE   VERSION
# m-k8s    Ready    control-plane   49m   v1.25.0
# w1-k8s   Ready    <none>          43m   v1.25.0
# w3-k8s   Ready    <none>          15m   v1.25.0

kubectl get nodes -o wide
# [root@m-k8s vagrant]# kubectl get nodes -o wide
# NAME     STATUS   ROLES           AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION                CONTAINER-RUNTIME
# m-k8s    Ready    control-plane   49m   v1.25.0   192.168.1.10    <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7
# w1-k8s   Ready    <none>          43m   v1.25.0   192.168.1.101   <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7
# w3-k8s   Ready    <none>          15m   v1.25.0   192.168.1.103   <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7
```

## 2. Pod

```shell
#######################
# [Kubernetes Server] #
#######################

kubectl get pod
# [root@m-k8s vagrant]# kubectl get pod
# No resources found in default namespace.

kubectl run nginx --image=nginx
# [root@m-k8s vagrant] # kubectl run nginx --image=nginx
# pod/nginx created

kubectl get pod
# [root@m-k8s vagrant]# kubectl get pod
# NAME    READY   STATUS    RESTARTS   AGE
# nginx   1/1     Running   0          97s

kubectl get pod -o wide
# [root@m-k8s vagrant]# kubectl get pod -o wide
# NAME    READY   STATUS    RESTARTS   AGE    IP             NODE     NOMINATED NODE   READINESS GATES
# nginx   1/1     Running   0          100s   172.16.132.1   w3-k8s   <none>           <none>
```

## 3. Access To Pod

```shell
##################
# [Host Machine] #
##################

ping 172.16.132.1
# Ping 172.16.132.1 32바이트 데이터 사용:
# 요청 시간이 만료되었습니다.
# 요청 시간이 만료되었습니다.
# 요청 시간이 만료되었습니다.
# 요청 시간이 만료되었습니다.

# 172.16.132.1에 대한 Ping 통계:
#     패킷: 보냄 = 4, 받음 = 0, 손실 = 4 (100% 손실),
```

### 3.a. Solutions

- Destroy network firewall [BAD!!!!]
- Create SVC(Service) in DMZ

```shell
#######################
# [Kubernetes Server] #
#######################

kubectl expose pod nginx --type=NodePort --port=80
# [root@m-k8s vagrant]# kubectl expose pod nginx --type=NodePort --port=80
# service/nginx exposed

kubectl get service
# [root@m-k8s vagrant]# kubectl get service
# NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
# kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP        60m
# nginx        NodePort    10.104.108.111   <none>        80:`31003`/TCP   5m37s

kubectl get nodes -o wide
# [root@m-k8s vagrant]# kubectl get nodes -o wide
# NAME     STATUS   ROLES           AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION                CONTAINER-RUNTIME
# m-k8s    Ready    control-plane   59m   v1.25.0   192.168.1.10    <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7
# w1-k8s   Ready    <none>          53m   v1.25.0   `192.168.1.101` <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7
# w3-k8s   Ready    <none>          26m   v1.25.0   192.168.1.103   <none>        CentOS Linux 7 (Core)   3.10.0-1160.90.1.el7.x86_64   containerd://1.6.7

curl http://192.168.1.101:31003/
# curl http://`192.168.1.101`:`31003`/
```