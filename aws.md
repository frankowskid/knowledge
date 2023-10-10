### Docker login
```shell
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin <ECR_URL>
```

### AWS session check
```shell
@if ! aws sts get-caller-identity; then \
  		echo "Something is wrong with your AWS session. Please check the details and try again."; \
  		exit 1; \
  	else \
		echo "Your AWS session is valid."; \
	fi
```

### Session Manager session
```shell
aws ssm start-session --target <TARGET>
```

### Port forward with SSM
```shell	
 aws ssm start-session \
  --target <TARGET> \
  --document-name AWS-StartPortForwardingSessionToRemoteHost \
  --parameters '{"host":["<HOSTNAME>"],"portNumber":["3306"], "localPortNumber":["3307"]}'
```

```
aws ssm start-session \
  --target `aws ec2 describe-instances --filters 'Name=tag:Name,Values=<INSTANCE_NAME>' --output text --query 'Reservations[*].Instances[*].InstanceId' --region ap-northeast-1` \
  --document-name AWS-StartPortForwardingSessionToRemoteHost \
  --parameters '{"host":[???"],"portNumber":["3306"], "localPortNumber":["3307"]}'
```
	
### K8s config
```shell
aws eks --region us-east-1 update-kubeconfig --name <NAME>
```

### All active ingress
```
(echo "URL SERVICE NAMESPACE INGRESS_NAME" &&            
kubectl get --all-namespaces ingress -o json 2> /dev/null | jq -r '
           .items[] | 
                   .metadata.name as $name | 
                   .metadata.namespace as $namespace | 
                   .spec.rules[]? | 
                   .host as $host | 
                   .http.paths[] | 
                   "https://\($host)\(.path) \(.backend.service.name) \($namespace) \($name)"' | sort ) | column -t
```
