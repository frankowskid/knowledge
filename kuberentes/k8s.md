

kubectl debug -n <namespace> -it <pod> --image=<image> --target=<container>
  
Where namespace is namespace where pod is running, pod is pod name you want to debug, 
  image is path your debug/tooling image (it can be base JDK image or even alpine, etc…) 
  and container is name of container you want to target (this is important to share process namespace, to see the processes).
  Container name is defined in deployment specification.  
  
```  
kubectl debug -n <test-ns> -it <pod-name> 
  --image=ecr:jdk-zulu-openjdk --target=<??>
 ```

  
### Thread dump
```
kubectl exec -it <POD> -- sh
for proc in /proc/*/cmdline; do echo $(basename $(dirname $proc)) $(cat $proc | tr "\0" " "); done
kill -3 1
kubectl logs -f <POD>
```

### Copy file from POD

kubectl exec <<deployment/service-name>> --namespace <service-namespace> --  tar cf - /app/profiler-output/$1 | tar x --to-stdout > `echo $1 | tr : _`

