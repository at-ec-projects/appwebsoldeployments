# Setup Local Kubernetes Cluster with Minikube with Virtualbox Driver
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

We used service type as LoadBalancer but service type LoadBalancer is working fine while creating simple Deployment but while configuring the deployment through terraform script we created the service as NodePort and the Deployment objects because if we take LoadBalancer as service type it is continuously analysing for the external ip.

-> kubectl create -f hello1.yml
-> kubectl create -f hello2.yml
-> kubectl create -f hello3.yml

Step-7

We created an ingress resource for each service using combination of minikube ip + nip.io which is configured in ingress.yml.
-> kubectl apply -f ingress.yml
Below are the combinations:
-> http://first.192.168.99.101.nip.io/
-> http://second.192.168.99.101.nip.io/
-> http://third.192.168.99.101.nip.io/

Step-8

Download Terraform.exe and create a directory called terraform and keep terraform.exe inside it.
Configured all the resources again using Terraform script main.tf
Initialize:
-> terraform.exe init
Verify:
-> terraform.exe plan
Apply:
-> terraform.exe apply
It will create a state file


# To Run project at a publically accessible URL    

Below are the Steps:

Step-1

Created an EC2 instance on AWS and the same has been attached to an elastic IP

Step-2

Installed kubectl and minikube

Step-3

Using the terraform script main_ec2.tf i created the deployments

Step-4

Installed Nginx and used the same as Reverse proxy by unlink the default configuration file and creating the new one.

Step-5

Below Url's can be publicaly launched from anywhere

-> http://first.15.207.24.5.nip.io/
-> http://second.15.207.24.5.nip.io/
-> http://third.15.207.24.5.nip.io/

# Note:Here we used service type as NodePort and not LoadBalancer as in AWS creating a Load Balancer includes some cost.
