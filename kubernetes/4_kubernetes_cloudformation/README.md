[< Backaward](../README.md)

# Kubernetes Cloudformation

### 0. Get Ip Address

```shell
curl -s ipinfo.io/ip
```

<br>

### 1. Deploy K8S Control Plain (Local LocalHostMachine)

```cmd
# Win, Cmd
for /f %i in ('curl -s ipinfo.io/ip') do aws cloudformation deploy                          ^
    --template-file ./myeks-1week.yaml                                                      ^
    --stack-name myeks                                                                      ^
    --parameter-overrides KeyName=myeks-pem SgIngressSshCidr=%i/32                          ^
    --region ap-northeast-2                                                                 ^
    --profile eksprac
```
```shell
# Ubuntu, Shell
aws cloudformation deploy                                                                   \
    --template-file         ./myeks-1week.yaml                                              \
    --stack-name            myeks                                                           \
    --parameter-overrides   KeyName=myeks-pem SgIngressSshCidr=$(curl -s ipinfo.io/ip)/32   \
    --region                ap-northeast-2                                                  \
    --profile               eksprac
```

<br>

### 2. Access K8S Control Plain  (Local LocalHostMachine)

```cmd
# Win, Cmd
for /f %i in ('aws ec2 describe-instances --filters "Name=tag:Name,Values=myeks-host"       ^
                            --query "Reservations[0].Instances[0].PublicIpAddress"          ^
                            --profile eksprac') do ssh root@%i
```
```shell
# Ubuntu, Shell
ssh root@$(aws ec2 describe-instances --filters "Name=tag:Name,Values=myeks-host"           \
                            --query "Reservations[0].Instances[0].PublicIpAddress"          \
                            --profile eksprac)
```

<br>

### 3. Configure IAM Credentials (EC2, ClientHost)

```shell
aws configure
```

### 4. Set up environment (EC2, ClientHost)

```shell
# 4.1. Set env value (Key:VPCID)
export VPCID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$CLUSTER_NAME-VPC" | jq -r .Vpcs[].VpcId)
echo "export VPCID=$VPCID" >> /etc/profile
echo $VPCID

# 4.2. Check VPC Subnet
aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPCID" --output yaml | yh

export PubSubnet1=$(aws ec2 describe-subnets --filters Name=tag:Name,Values="$CLUSTER_NAME-PublicSubnet1" --query "Subnets[0].[SubnetId]" --output text)
export PubSubnet2=$(aws ec2 describe-subnets --filters Name=tag:Name,Values="$CLUSTER_NAME-PublicSubnet2" --query "Subnets[0].[SubnetId]" --output text)

echo "export PubSubnet1=$PubSubnet1" >> /etc/profile
echo "export PubSubnet2=$PubSubnet2" >> /etc/profile

echo $PubSubnet1
echo $PubSubnet2
```

### 5. Install HELM (EC2, ClientHost) (Skipped, Already Installed)

<!-- ```shell
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
``` -->

### 6. Create EKS Cluster and NodeGroup (EC2, ClientHost)

```shell
# 6.1. Check Cluster Files with dry run
eksctl create cluster                               \
    --name $CLUSTER_NAME                            \
    --region=$AWS_DEFAULT_REGION                    \
    --nodegroup-name=$CLUSTER_NAME-nodegroup        \
    --node-type=t3.medium                           \
    --node-volume-size=32                           \
    --node-ami-family Ubuntu2004                    \
    --vpc-public-subnets "$PubSubnet1,$PubSubnet2"  \
    --version 1.28                                  \
    --ssh-access                                    \
    --external-dns-access                           \
    --verbose 4                                     \
    --dry-run | yh

# 6.2. Deploy
eksctl create cluster                               \
    --name $CLUSTER_NAME                            \
    --region=$AWS_DEFAULT_REGION                    \
    --nodegroup-name=$CLUSTER_NAME-nodegroup        \
    --node-type=t3.medium                           \
    --node-volume-size=32                           \
    --node-ami-family Ubuntu2004                    \
    --vpc-public-subnets "$PubSubnet1,$PubSubnet2"  \
    --version 1.28                                  \
    --ssh-access                                    \
    --external-dns-access                           \
    --verbose 4
```

### 7. Download and Install Nginx-Ingreee-Controller (EC2, ClientHost)

```shell
# 7.1. Add nginx-stable using helm
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

# 7.2. Install nginx-ingress using helm
helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true

kubectl get services nginx-ingress-controller
```

### 8. Watch logs of Nginx-Ingress-Controller (EC2, ClientHost)

```shell
kubectl logs -f $(kubectl get pods -l app.kubernetes.io/instance=nginx-ingress -o custom-columns=:metadata.name)
```

### 9. Uplaod Server Application into ECR (EC2, LocalHostMachine)

```cmd
# 9.1. Create ECR Repository
aws ecr create-repository               ^
    --repository-name myeks_app_ecr     ^
    --tags Key=Name,Value=myeks_app_ecr ^
    --profile eksprac
    
# 9.2. Describe ECR Repository
aws ecr describe-repositories                                   ^
    --query "repositories[?repositoryName=='myeks_app_ecr']"    ^
    --query "repositories[0].repositoryUri"                     ^
    --profile eksprac

# 9.3. Get ECR Password
aws ecr get-login-password  ^
    --region ap-northeast-2 ^
    --profile eksprac

# 9.4. Docker Login
docker login --username AWS --password <PASSWORD> <ECR_URI>

# 9.5. Cd codes
cd ./app

docker build -t myeks_app_ecr .

docker tag myeks_app_ecr <ECR_URI>
docker push <ECR_URI>

docker tag myeks_app_ecr <AWS_ACCOUNT>.dkr.ecr.ap-northeast-2.amazonaws.com/myeks_app_ecr:latest
docker push <AWS_ACCOUNT>.dkr.ecr.ap-northeast-2.amazonaws.com/myeks_app_ecr:latest
```

### 10. Create K8S Deployment (EC2, ClientHost)

```shell
kubectl apply -f k8s.server.yml

kubectl expose deployment d-myeks-app-ecr --name svc-myeks-app-ecr --port=80 --target-port=80 --type=LoadBalancer

kubectl apply -f k8s.nginx.ingress.controller.yml
```