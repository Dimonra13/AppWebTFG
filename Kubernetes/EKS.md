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

**Importante: Para conectarse al cluster desde un equipo distinto al original en el que fue creado debe usarse el siguiente comando para actualizar el archivo kubeconfig y establecer la conexión con el cluster:**
```
aws eks --region eu-west-3 update-kubeconfig --name ekscluster
```

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

## Paso 3. Desplegar el Kubernetes Dashboard

**Este paso es opcional, si no desea desplegarse el Kubernetes Dashboard puede saltarse directamente al paso 4**  
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
  
  [Dashboard1]()
  
  
## Paso 4. Desplegar el Vertical Pod Autoscaler

El Vertical Pod Autoscaler de Kubernetes gestiona automáticamente la cantidad de CPU y RAM que necesitan los pods para funcionar, de forma que se aumenta o disminuye la CPU/RAM de cada pod según sus necesidades en cada momento. Esto ayuda a disminuir los costes y dar servicio aunque el número de usuarios crezca muy rápidamente.

Para desplegar el Vertical Pod Autoscaler debemos seguir los siguientes pasos:
1.- Abrir una shell y colocarnos en el directorio en el que deseamos guardar el código fuente del autoscaler.  
2.- Clonar el repositorio de kubernetes/autoscaler en Github:
```
git clone https://github.com/kubernetes/autoscaler.git
```
3.- Ir al directorio vertical-pod-autoscaler en la shell:
```
cd autoscaler/vertical-pod-autoscaler/
```
4.- Desplegar el Vertical Pod Autoscaler en el cluster:
```
./hack/vpa-up.sh
```
Se puede verificar que la instalación ha sido correcta usando el siguiente comando:
```
kubectl get pods -n kube-system
```
La salida debe ser similar a esta:
```
NAME                                        READY   STATUS    RESTARTS   AGE
aws-node-5bm2g                              1/1     Running   0          6h36m
aws-node-dwpcz                              1/1     Running   0          6h34m
aws-node-grznn                              1/1     Running   0          6h35m
coredns-78c77d8677-6ftmt                    1/1     Running   0          6h34m
coredns-78c77d8677-xtg6d                    1/1     Running   0          6h34m
kube-proxy-4g6w9                            1/1     Running   0          6h35m
kube-proxy-htzv2                            1/1     Running   0          6h34m
kube-proxy-vfks6                            1/1     Running   0          6h36m
metrics-server-7949d47784-vgf9f             1/1     Running   0          6h1m
vpa-admission-controller-556cc48ddd-9cwwk   1/1     Running   0          11s
vpa-recommender-8bdbf5-f5dhj                1/1     Running   0          13s
vpa-updater-67b4b4b44d-wqvbm                1/1     Running   0          13s
```

IMPORTANTE: Para poder ejecutar este paso es necesario tener instalado OpenSSL 1.1.1 y tener la ruta del archivo en el PATH. Como en windows puede dar problemas puede usarse la version 0.8 que no necesita OpenSSL. Puede descargarse en la siguiente ruta: https://github.com/kubernetes/autoscaler/tree/vpa-release-0.8.git  
**Es muy recomendable realizar este paso en linux si es posible para evitar problemas.**

Para desinstalar el Vertical Pod Autoscaler puede usarse el siguiente comando:
```
./hack/vpa-down.sh
```

## Paso 5. Desplegar la base de datos MySQL

Desplegaremos la base de datos igual que como lo hacíamos en minikube.

### 5.1. Ir a la carpeta MySQL en una shell

Abrimos una shell en la carpeta raíz del proyecto y escribimos:

```
cd ./Kubernetes/MySQL
```

### 5.2. Desplegar el Volumen Persistente

Este volumen es necesario para que los datos almacenados en la base de datos MySQL no se pierdan al reiniciar el contenedor o el deployment (mientras el cluster exista los datos estarán almacenados).

```
kubectl create -f persistence_volume.yaml
```

### 5.3. Desplegar el Volume Claim para el volumen persistente

```
kubectl create -f pv_claim.yaml
```

### 5.4. Desplegar el Deployment MySQL

```
kubectl create -f mysql_deployment.yaml
```

### 5.5. Desplegar el Servicio MySQL

```
kubectl create -f mysql_service.yaml
```

### Acceder a la base de datos MySQL con un pod cliente

Esto puede ser muy útil para cargar dumps, comprobar que los datos se guardan correctamente y acceder a logs de errores.

```
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppass
	
```

## Paso 6. Desplegar el controlador del balanceador de carga de AWS

Este controlador es necesario para poder desplegar ingress load balancers y poder acceder a nuestra aplicación web desde fuera del cluster.

1.- En caso de no haber usado la opción --with-oidc al crear el cluster debe usarse el siguiente comando para crear un provedor OIDC de IAM y asociarlo al cluster:
```
eksctl utils associate-iam-oidc-provider --region eu-west-3 --cluster ekscluster --approve
```
2.- Ir a la carpeta Kubernetes/policy en una shell usando el comando:
```
cd ./Kubernetes/policy
```
3.- Descargue una política de IAM para el controlador del balanceador de carga de AWS (en caso de tener la política YA descargada ir al paso 4 directamente). Puede descargarse esta politica usando:
```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json
```
4.- Crear la política IAM y copiar el ARN que devuelve el comando como salida:
```
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam-policy.json
```

5.- Usar el siguiente comando para crear un rol de IAM, una cuenta de servicio de Kubernetes denominada aws-load-balancer-controller en el espacio de nombres kube-system, un rol de clúster y un enlace de rol de clúster para que lo utilice el controlador usando la política creada en el paso 4:
```
eksctl create iamserviceaccount --cluster=ekscluster --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=ARN_POLICY --override-existing-serviceaccounts --approve
```

6.- Finalmente, debemos instalar elcontrolador del balanceador de carga de AWS. A continuación se muestra como instalarlo usando helm ( en caso de no tener helm puede instalarse siguiendo los pasos que pueden verse en el siguiente enlace: https://helm.sh/docs/intro/install/ ):  
Usar el siguiente comando para instalar las definiciones de recursos personalizados de TargetGroupBinding:
```
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
```
Añadir el repositorio de eks-charts con el comando:
```
helm repo add eks https://aws.github.io/eks-charts
```
Instalar el controlador:
```
helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller --set clusterName=ekscluster --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller -n kube-system
```
**Para comprobar que el controlador se ha instalado correctamente puede usarse el comando:**
```
kubectl get deployment -n kube-system aws-load-balancer-controller
```
La salida debe ser similar a:
```
NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
aws-load-balancer-controller   1/1     1            1           13s
```


## Paso 7. Crear/importar el certificado público

**Este paso no es necesario si se va a desplegar la aplicación usando http y no https, tampoco es necesario si ya se tiene un certificado en ACM para el dominio de la aplicación. En cualquiera de los pasos saltar directamente al paso 8**
Los certificados SSL/TLS son necesarios para poder desplegar aplicaciones usando https, para que nuestro Ingress Load Balancer teng acceso a estos certificados y pueda redireccionar el tráfico con https es necesario almacenar los certificados en ACM (AWS Certificate Manager). Para ello tenemos dos opciones:

### Solicitar a ACM que genere un certificado nuevo para nuestro dominio
Los certificados públicos son gratuitos en ACM, además de que ACM se encarga de gestionarlos y renovarlos, así esta opción resulta muy conveniente. Para genere el certificado usaremos el comando:
```
aws acm request-certificate --domain-name *.coursing.me --validation-method DNS --idempotency-token 1234 --options CertificateTransparencyLoggingPreference=DISABLED
```
### Importar un certificado nuevo para nuestro dominio
En caso de que ya tengamos un certificado y no queramos usar los proporcionados por ACM, podemos importar el nuestro usando el comando:
```
aws acm import-certificate --certificate fileb://certificate.pem --private-key fileb://key.pem 
```

**Es muy importante guardar el arn del certificado que se obtiene como salida de ambos comandos**

## Paso 8. Desplegar la aplicación web
Para desplegar la aplicación web y que sea accesible desde el exterior del cluster debemos seguir los siguientes pasos:

### 8.1. Ir a la carpeta App en una shell

Abrir una shell en la carpeta raíz del proyecto y escribimos:

```
cd ./Kubernetes/App
```
### 8.2. Desplegar el Deployment de la App

```
kubectl create -f webapp_deployment.yaml
```

### 8.3. Desplegar el Servicio de la App

```
kubectl create -f webapp_service.yaml
```
### 8.4. Desplegar el load balancer Ingress de la Aplicación

```
kubectl create -f webapp_ingress.yaml
```

## Paso 9. Desplegar el Horizontal Pod Autoscaler
El Horizontal Pod Autoscaler se encarga de aumentar o disminuir el número de pods de un deployment en función del tráfico que le llega, de forma que junto con el vertical autoscaler se encargan de que el número de replicas y la CPU y RAM de cada réplica sean las justas y necesarias.Por tanto, son muy importantes a la hora de garantizar la disponibilidad y reducir costes. Para desplegar un Horizontal Pod Autoscaler para el deployment de nuestra aplicación es suficiente con usar el comando:
```
kubectl autoscale deployment webapp --cpu-percent=50 --min=1 --max=10
```

**Para probar el Horizontal Pod Autoescaler pueden usarse los siguiente comando (debe ejecutarse en una shell nueva):**
```
kubectl run -it --rm load-generator --image=busybox /bin/sh --generator=run-pod/v1
```
Cuando aparezca un prompt se debe escribir el siguiente programa para que genere tráfico en nuestro deployment y el Autoscaler se active:
```
while true; do wget -q -O- URL_APP; done
```
En otra shell podemos usar siguiente comando para comprobar el número de replicas y el porcentaje de CPU usado de cada réplica:
```
kubectl get hpa
```
La salida esperada debe ser similar a:
```
NAME     REFERENCE           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   1%/50%    1         10        1          57s
```
```
NAME     REFERENCE           TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   134%/50%   1         10        3          105s
```
```
NAME     REFERENCE           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   0%/50%    1         10        1          12m
```
Una vez comprobado que funciona, usamos Ctrl+C en la shell para dejar de generar tráfico, cerramos la shell y en nuestra shell original usamos el siguiente comando para eliminar el generador de carga:
```
kubectl delete pod load-generator
```
**Para eliminar el Horizontal Pod Autoscaler se puede usar el comando:**
```
kubectl delete horizontalpodautoscaler.autoscaling/webapp
```
## Eliminar el cluster

Para evitar tener que pagar por el tiempo que el cluster no se este usando, especialmente en las primeras fases del desarrollo donde solo se pretenden realizar pruebas, debe eliminarse el cluster y sus servicios asociados. 

Para ello debemos seguir los siguientes pasos:

1.- Listar todos los servicios del cluster:
```
kubectl get svc --all-namespaces
```
2.- Eliminar todos los servicios que tengan una EXTERNAL-IP que aparezcan en la salida del comando anterior (los que no tengan una IP externa se eliminarán al borrarse el cluster). Para ello puede usarse el comando:
```
kubectl delete svc NOMBRE_SERVICIO
```
3.- Eliminar el cluster y sus nodos:
```
eksctl delete cluster --name ekscluster
```



