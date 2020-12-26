# Como desplegar la aplicación web en AWS usando EKS paso a paso

Para desplegar una apliacación en AWS usando EKS es necesario:

* Tener una cuenta de AWS con un AWS Access key ID y un AWS Access Secret para el usuario root o el usuario IAM que se va ha usar para administrar EKS
* Instalar AWS CLI (preferiblemente la versión 2)
* Instalar eksctl
* Instalar kubectl

Puede encontrarse una guía de instalación de estas herramientas para los diferentes sistemas operativos en: https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

Nota: A lo largo de este archivo se emplearán comandos validos para todas las regines excepto para Beijing and Ningxia China, donde deben usarse comandos especificos

## Paso 1. Crear un Cluster 

En esta sección se explica como crear un cluster con las características necesarias para deplegar aplicaciones dockerizadas con EKS usando eksctl, este cluster podrá desplegarse
tanto usando Fargate como instancias EC2 para los nodos. En función del tráfico esperado y de tipo de plan de su cuenta de AWS puede ser más convemiente usar un tipo de nodo u 
otro (si se usa el plan gratuito hay que tener en cuenta que hay 750 horas mensuales de EC2 incluidas en este plan, mientras que de Fargate no hay).

### 1.1. Crear el cluster usando Fargate

```
eksctl create cluster --name ekscluster --version 1.18 --region eu-west-3 --fargate
```

### 1.2. Crear el cluster usando instancias EC2

Es recomendable establecer una clave ssh para poder conectarnos a las instancias de EC2 que usaremos en el cluster, para crear esta clave puede serguirse la guía: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html#creating-a-key-pair

```
eksctl create cluster --name ekscluster --version 1.18 --region eu-west-3 --nodegroup-name linux-nodes --nodes 3 --nodes-min 1 --nodes-max 4 --with-oidc --ssh-access --ssh-public-key  MyKeyPair --managed
```

Para comprobar que la configuración de kubectl es correcta y se puede conectar al cluster se puede usar el comando:

```
kubectl get svc
```
La salida debe ser algo similar a:

```
NAME             TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
svc/kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   1m
```
Si se obtiene como salida un mensaje de error se puede ver https://docs.aws.amazon.com/eks/latest/userguide/troubleshooting.html#unauthorized para resolverlo.

## Paso 2. Instalar el Kubernetes Metrics Server

El Kubernetes Metrics Server permite instalar en el cluster EKS servicios muy importantes como el kubernetes dashboard que permite controlar el estado de los diferentes workloads
desplegados en el cluster o el vertical autoscaler que se encarga de gestionar la cantidad de vCPU y RAM necesaria para los diferentes pods.

Para desplegar el metric server en el cluster es suficiente con usar el comando:

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml
```

Para verificar el estado del metrics-server se puede usar el comando:

```
kubectl get deployment metrics-server -n kube-system
```
La salida debe ser algo similar a:
```
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
metrics-server   1/1     1            1           6m
```

## Paso 3. Instalar el Kubernetes Dashboard

El kubernetes dashboard permite controlar el estado de los diferentes workloads desplegados en el cluster ( servicios, deployments, pods, etc). Además muestra estadísticas
sobre el uso de CPU y otros recursos.

Para desplegar el dashboard debe usarse el siguiente comando:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml
```
La salida debe ser algo similar a:
```
namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
secret/kubernetes-dashboard-certs created
secret/kubernetes-dashboard-csrf created
secret/kubernetes-dashboard-key-holder created
configmap/kubernetes-dashboard-settings created
role.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
deployment.apps/kubernetes-dashboard created
service/dashboard-metrics-scraper created
deployment.apps/dashboard-metrics-scraper created
```
Por defecto el kuberntes dashboarda tiene unos permisos limitados, por lo que para poder usar todas sus funciones es necesario crear una eks-admin service account and cluster role binding y vincularla al kubernetes dashboard. Para crear esta cuenta deberemos seguir los siguientes pasos:

  1.- Crear un archivo similar al eks-admin-service-account.yaml situado en la carpeta Kubernetes/dashboard 
    
  2.- Colocarnos en la carpeta Kubernetes/dashboard:
   ```
   cd ./Kubernetes/dashboard
   ```
  3.- Desplegar el eks-admin service acount:
   ```
   kubectl apply -f eks-admin-service-account.yaml
   ```
   La salida debe ser similar a:
   ```
   serviceaccount "eks-admin" created
   clusterrolebinding.rbac.authorization.k8s.io "eks-admin" created
   ````
Finalmente, para poder conectarnos al dashboard debemos:
  
  1.- Usar el siguiente comando para conseguir el token de autenticación del eks_admin:
  ```
  kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
  ```
  2.- Abrir una nueva shell y escribir el comando:
  ```
  kubectl proxy
  ```
  3.- Accedemos al dashboard con la siguiente url:
  ```
  http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login
  ```
  4.- Elegimos "token" y pegamos el token obtenido en la salida del paso 1:
  
  
