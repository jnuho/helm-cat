#!/bin/bash

# Enable nginx ingress controller
# 1. minikube addon



if [ "$(kubectl config current-context)" = "minikube" ]; then
    minikube addons enable ingress
fi

#foo@ubuntu-2:~/CatVsNonCat/script$ k get pod -n ingress -o wide
#NAME                                      READY   STATUS    RESTARTS      AGE     IP             NODE       NOMINATED NODE   READINESS GATES
#nginx-ingress-microk8s-controller-24zmd   1/1     Running   5 (34m ago)   6d19h   10.1.163.174   ubuntu-3   <none>           <none>
#nginx-ingress-microk8s-controller-lg9fr   1/1     Running   5 (95s ago)   6d19h   10.1.243.38    ubuntu-2   <none>           <none>
#nginx-ingress-microk8s-controller-zjd7w   1/1     Running   4 (30m ago)   6d19h   10.1.185.106   ubuntu-1   <none>           <none>

# OR
# 2.helm
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm install ingress-nginx ingress-nginx/ingress-nginx

#sleep 1

# Define ingress routing rule
if [ "$(kubectl config current-context)" = "minikube" ]; then
    kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
elif [ "$(kubectl config current-context)" = "pi" ]; then
    kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
fi

#sleep 1

