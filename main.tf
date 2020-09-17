terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {}

resource "kubernetes_deployment" "hellofirst" {
  metadata {
    name = "hellofirst"
    }
  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "hellofirst"
      }
    }
    template {
      metadata {
        labels = {
          App = "hellofirst"
        }
      }
      spec {
        container {
          image = "paulbouwer/hello-kubernetes:1.8"
          name  = "hellofirst"

          port {
            container_port = 8080
          }
          env {
            name = "MESSAGE"
	    value = "Hello From First Deployment"

          }
          }
        }
      }
    }
  }


resource "kubernetes_deployment" "hellosecond" {
  metadata {
    name = "hellosecond"
    }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "hellosecond"
      }
    }
    template {
      metadata {
        labels = {
          App = "hellosecond"
        }
      }
      spec {
        container {
          image = "paulbouwer/hello-kubernetes:1.8"
          name  = "hellosecond"

          port {
            container_port = 8080
          }
          env {
            name = "MESSAGE"
	    value = "Hello From Second Deployment"

          }
          }
        }
      }
    }
  }


resource "kubernetes_deployment" "hellothird" {
  metadata {
    name = "hellothird"
    }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "hellothird"
      }
    }
    template {
      metadata {
        labels = {
          App = "hellothird"
        }
      }
      spec {
        container {
          image = "paulbouwer/hello-kubernetes:1.8"
          name  = "hellothird"

          port {
            container_port = 8080
          }
          env {
            name = "MESSAGE"
	    value = "Hello From Third Deployment"

          }
          }
        }
      }
    }
  }



resource "kubernetes_service" "hellofirst" {
  metadata {
    name = "hellofirst"
  }
  spec {
    selector = {
      App = kubernetes_deployment.hellofirst.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "hellosecond" {
  metadata {
    name = "hellosecond"
  }
  spec {
    selector = {
      App = kubernetes_deployment.hellosecond.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "hellothird" {
  metadata {
    name = "hellothird"
  }
  spec {
    selector = {
      App = kubernetes_deployment.hellothird.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_ingress" "ingress-hosts" {
  metadata {
    name = "ingress-hosts"
  }

  spec {

    rule {
      host = "first.192.168.99.101.nip.io"
      http {
        path {
          backend {
            service_name = "hellofirst"
            service_port = 8080
          }
        }

      }
    }


     rule {
      host = "second.192.168.99.101.nip.io"
      http {
        path {
          backend {
            service_name = "hellosecond"
            service_port = 8080
          }
        }

      }
    }


     rule {
      host = "third.192.168.99.101.nip.io"
      http {
        path {
          backend {
            service_name = "hellothird"
            service_port = 8080
          }
        }

      }
    }


  }
}

