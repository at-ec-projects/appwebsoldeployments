# appwebsoldeployments
# All yaml files are under addwebsoldeployments
# Refer ScreenShots provided in images

Step-1

First i installed the kubectl in my local windows machine and set the env variables

Step-2

A virtualbox was already installed on my windows machine

Step-3

Secondly i installed minikube which created a virtual machine minikube in virtualbox

Step-4

After installing minikube i created a Deployments directory and 3 yml files hello1.yml,hello2.yml,hello3.yml

Step-5

Above yml files configures three different services of type NodePort and three Deployment objects with three different Message

Step-6

We used service type as NodePort because service type LoadBalancer is working fine while applying simple Deployment but while configuring the deployment through terraform script it creates the service and the Deployment objects but is continuously analysing for the external ip.

Step-7

We created an ingress resource for each service using combination of minikube ip + nip.io which is configured in ingress.yml.Below are the combinations:
http://first.192.168.99.101.nip.io/
http://second.192.168.99.101.nip.io/
http://third.192.168.99.101.nip.io/

Step-8

Configured all the resources again using Terraform script main.tf
