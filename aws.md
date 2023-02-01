#Docker login

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin <ECR_URL>


@if ! aws sts get-caller-identity; then \
  		echo "Something is wrong with your AWS session. Please check the details and try again."; \
  		exit 1; \
  	else \
		echo "Your AWS session is valid."; \
	fi
