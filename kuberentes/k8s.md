

kubectl debug -n <namespace> -it <pod> --image=<image> --target=<container>
  
Where namespace is namespace where pod is running, pod is pod name you want to debug, 
  image is path your debug/tooling image (it can be base JDK image or even alpine, etc…) 
  and container is name of container you want to target (this is important to share process namespace, to see the processes).
  Container name is defined in deployment specification.  
  
```  
kubectl debug -n <test-ns> -it <pod-name> 
  --image=ecr:jdk-zulu-openjdk --target=<??>
 ```
