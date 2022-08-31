# Screenshots
To help review your infrastructure, please include the following screenshots in this directory::

## Deployment Pipeline
* DockerHub showing containers that you have pushed
* GitHub repository’s settings showing your Travis webhook (can be found in Settings - Webhook)
* Travis CI showing a successful build and deploy job

## Kubernetes
* To verify Kubernetes pods are deployed properly
```bash
kubectl get pods
```
![img.png](get-pods.png)

* To verify Kubernetes services are properly set up
```bash
kubectl get deployments
```
![img.png](get-deployments.png)

```bash
kubectl describe services
```
![img.png](describe-services-1.png)
![img.png](describe-services-2.png)
![img.png](describe-services-3.png)
![img.png](describe-services-4.png)
![img.png](describe-services-5.png)
* To verify that you have horizontal scaling set against CPU usage
```bash
kubectl describe hpa
```
![img.png](describe-hpa.png)
* To verify that you have set up logging with a backend application
```bash
kubectl logs {pod_name}
```
