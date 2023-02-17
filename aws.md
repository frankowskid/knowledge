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
````shell
aws ssm start-session --target <TARGET>
```

### Port forward with SSM
```shell	
 aws ssm start-session \
  --target <TARGET> \
  --document-name AWS-StartPortForwardingSessionToRemoteHost \
  --parameters '{"host":["<HOSTNAME>"],"portNumber":["3306"], "localPortNumber":["3307"]}'
```
	
### K8s config
```shell
aws eks --region us-east-1 update-kubeconfig --name <NAME>
```
