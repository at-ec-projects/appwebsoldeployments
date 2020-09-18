# appwebsoldeployments
# All yaml files are under addwebsoldeployments
# Refer ScreenShots.zip provided

Step-1

First i installed the kubectl in my local windows machine and set the env variables

Step-2

A virtualbox was already installed on my windows machine

Step-3

Secondly i installed minikube which created a virtual machine minikube in virtualbox

minikube start

Step-4

After installing minikube i created a Deployments directory and 3 yml files hello1.yml,hello2.yml,hello3.yml

Step-5

Above yml files configures three different services of type LoadBalancer and three Deployment objects with three different Message

Step-6

We used service type as LoadBalancer but service type LoadBalancer is working fine while creating simple Deployment but while configuring the deployment through terraform script we created the service as NodePort and the Deployment objects but is continuously analysing for the external ip.

kubectl create -f hello1.yml
kubectl create -f hello2.yml
kubectl create -f hello3.yml

Step-7

We created an ingress resource for each service using combination of minikube ip + nip.io which is configured in ingress.yml.
kubectl apply -f ingress.yml
Below are the combinations:
http://first.192.168.99.101.nip.io/
http://second.192.168.99.101.nip.io/
http://third.192.168.99.101.nip.io/

Step-8

Configured all the resources again using Terraform script main.tf
Initialize
terraform.exe init
Verify
terraform.exe plan
Apply
terraform.exe apply
It will create a state file
