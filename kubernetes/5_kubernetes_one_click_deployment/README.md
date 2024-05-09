```cmd
for /F %i in ('curl -s ipinfo.io/ip') do aws cloudformation deploy  ^
  --template-file eks-oneclick.yaml     ^
  --stack-name myeks    ^
  --parameter-overrides KeyName=mykes-pem-2 SgIngressSshCidr=%i/32 MyIamUserAccessKeyID=>KEY> MyIamUserSecretAccessKey='<KEY>' ClusterBaseName=myeks   ^
  --region ap-northeast-2   ^
  --profile eksprac
```
for /f %i in ('aws cloudformation describe-stacks ^
  --stack-name myeks                          ^
  --query "Stacks[*].Outputs[0].OutputValue"  ^
  --output text                               ^
  --profile eksprac') do @ssh -i ~\mykes-pem-2.pem ec2-user@%i
`//