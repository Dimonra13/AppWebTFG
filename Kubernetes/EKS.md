# Como desplegar la aplicación web en AWS usando EKS paso a paso

Para desplegar una aplicación en AWS usando EKS es necesario:

* Tener una cuenta de AWS con un AWS Access key ID y un AWS Access Secret para el usuario root o el usuario IAM que se va a usar para administrar EKS
* Instalar AWS CLI (preferiblemente la versión 2)
* Instalar eksctl
* Instalar kubectl

Puede encontrarse una guía de instalación de estas herramientas para los diferentes sistemas operativos en: https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

Nota: A lo largo de este archivo se emplearán comandos válidos para todas las regines excepto para Beijing and Ningxia China, donde deben usarse comandos específicos

## Paso 1. Crear un Cluster 

En esta sección se explica como crear un cluster con las características necesarias para deplegar aplicaciones dockerizadas con EKS usando eksctl, este cluster podrá desplegarse
tanto usando Fargate como instancias EC2 para los nodos. En función del tráfico esperado y de tipo de plan de su cuenta de AWS puede ser más convemiente usar un tipo de nodo u 
otro (si se usa el plan gratuito hay que tener en cuenta que hay 750 horas mensuales de EC2 incluidas en este plan, mientras que de Fargate no hay).

### Opción 1. Crear el cluster usando Fargate

```
eksctl create cluster --name ekscluster --version 1.18 --region eu-west-3 --fargate
```

### Opción 2. Crear el cluster usando instancias EC2

Es recomendable establecer una clave ssh para poder conectarnos a las instancias de EC2 que usaremos en el cluster, para crear esta clave puede serguirse la guía: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html#creating-a-key-pair

```
eksctl create cluster --name ekscluster --version 1.18 --region eu-west-3 --nodegroup-name linux-nodes --nodes 1 --nodes-min 1 --nodes-max 4 --with-oidc --ssh-access --ssh-public-key  MyKeyPair --managed --asg-access
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

### Paso 1.1. Instalar el Cluster Autoscaler
**Este paso es opcional, puede resultar muy útil si se espera que la aplicación reciba picos de tráfico muy altos.**  
El Cluster Autoscaler se encarga de aumentar el número de nodos que tiene el cluster cuando los pods fallan por la falta de recursos o de disminuirlo cuando hay nodos que no están siendo usados. Si desea instalarse Cluster Autoscaler deben seguirse los siguientes pasos:

1.- Desplegar el deployment del Autoscaler con el siguiente comando:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
```
2.- Añadir la anotación "cluster-autoscaler.kubernetes.io/safe-to-evict" al deployment:
```
kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"
```
3.- Editar el deployment para replazar <YOUR CLUSTER NAME> con el nombre del cluster (ekscluster) y añadir las opciones:  
* <--balance-similar-node-groups>  
* <--skip-nodes-with-system-pods=false>
Puede usarse el siguiente comando para editar el archivo:
```
kubectl -n kube-system edit deployment.apps/cluster-autoscaler
```
Debe quedar de forma similar a:
```
    spec:
      containers:
      - command:
        - ./cluster-autoscaler
        - --v=4
        - --stderrthreshold=info
        - --cloud-provider=aws
        - --skip-nodes-with-local-storage=false
        - --expander=least-waste
        - --node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/ekscluster
        - --balance-similar-node-groups
        - --skip-nodes-with-system-pods=false
```
4.- En la página de https://github.com/kubernetes/autoscaler/releases buscar una release que empiece por el mismo número de versión que nuestra versión de kubernetes (La 1.18.3 en nuestro caso puede servir) y usar el siguiente comando para establecer el tag del autoscaler a esa versión:
```
kubectl -n kube-system set image deployment.apps/cluster-autoscaler cluster-autoscaler=eu.gcr.io/k8s-artifacts-prod/autoscaling/cluster-autoscaler:v1.18.3
```

**Para acceder a los logs del autoscaler puede usarse el siguiente comando:**
```
kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler
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

El Vertical Pod Autoscaler de Kubernetes calcula automáticamente la cantidad de CPU y RAM que necesitan los pods para funcionar, por lo que se trata de una herramienta muy útil para la gestión del clúster si no se conoce a ciencia cierta el consumo de recursos de los diferentes servicios desplegados.  

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
Una vez desplegado este mecanismo de escalado pueden usarse archivos de configuración para indicar que Deployments deben ser gestionados por este sistema.  
	
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
### 5.4. Desplegar el Secret 
Este secret es necesario para almacenar la información sensible de la base de datos (nombre y contraseña).

```
kubectl create -f mysql_secret.yaml
```
### 5.5. Desplegar el Deployment MySQL

```
kubectl create -f mysql_deployment.yaml
```

### 5.6. Desplegar el Servicio MySQL

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

6.- Finalmente, debemos instalar el controlador del balanceador de carga de AWS. A continuación se muestra como instalarlo usando helm ( en caso de no tener helm puede instalarse siguiendo los pasos que pueden verse en el siguiente enlace: https://helm.sh/docs/intro/install/ ):  
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
Los certificados públicos son gratuitos en ACM, además de que ACM se encarga de gestionarlos y renovarlos, así esta opción resulta muy conveniente. Para generar el certificado usaremos el comando:
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
### 8.3. Desplegar el VPA para la App  

```
kubectl create -f webapp_vpa.yaml
```
### 8.4. Desplegar el Servicio de la App

```
kubectl create -f webapp_service.yaml
```
### 8.5. Desplegar el load balancer Ingress de la Aplicación
Es importante tener en cuenta que en este archivo Ingress no se ha establecido el certificado SSL necesario para la utilización de conexiones seguras mediante HTTPS, en caso de que se prentenda usar este tipo de conexiones es necesario modificar este archivo incluyendo el arn del certificado SSL generado en el paso anterior.  
**Importante: En las últimas versiones de la aplicación web se ha modificado la configuración para obligar a usar el protocolo HTTPS, por lo que para poder seguir usando este archivo Ingress que emplea HTTP es necesario comentar las líneas de código que se indican en el archivo application.groovy.**
```
kubectl create -f webapp_ingress.yaml
```
### 8.6. Asignar el nombre de dominio a la IP del balanceador de carga  
Para que la aplicación web este disponible en el nombre de dominio deseado es necesario añadir un registro tipo A en nuestro servidor DNS que asocie la IP del balanceador de carga al nombre de dominio.  
## Paso 9. Desplegar el Horizontal Pod Autoscaler
El Horizontal Pod Autoscaler se encarga de aumentar o disminuir el número de pods de un deployment en función del tráfico que le llega, de forma que junto con el vertical autoscaler se encargan de que el número de replicas y la CPU y RAM de cada réplica sean las justas y necesarias.Por tanto, son muy importantes a la hora de garantizar la disponibilidad y reducir costes. Para desplegar un Horizontal Pod Autoscaler para el deployment de nuestra aplicación es suficiente con usar el comando:
```
kubectl autoscale deployment webapp --cpu-percent=70 --min=1 --max=3
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
webapp   Deployment/webapp   1%/70%    1         3         1          57s
```
```
NAME     REFERENCE           TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   134%/70%   1         3         3          105s
```
```
NAME     REFERENCE           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   0%/70%    1         3         1          12m
```
Una vez comprobado que funciona, usamos Ctrl+C en la shell para dejar de generar tráfico, cerramos la shell y en nuestra shell original usamos el siguiente comando para eliminar el generador de carga:
```
kubectl delete pod load-generator
```
**Para eliminar el Horizontal Pod Autoscaler se puede usar el comando:**
```
kubectl delete horizontalpodautoscaler.autoscaling/webapp
```
## Paso 10. Desplegar el script encargado de generar las recomendaciones de "Explore"
El módulo de inteligencia artificial permite generar recomendaciones de cursos de diversas categorías que se salen de las busquedas normales de cada usuario. Gracias a esto, los usuarios pueden descubrir cursos interesantes para ellos que no podrían encontrar de otra forma.  
Sin embargo, el cómputo de estas recomendaciones es muy lento, por lo que la aplicación no puede esperar a que se generen cada vez que el usuario hace una petición. La solución a este problema es el uso de un script que se ejecute una vez al día y genere estas recomenadaciones para todos los usuarios.  
Para ello, usuaremos un cronjob y seguiremos los siguientes pasos para desplegarlo:

### 10.1. Ir a la carpeta Script en una shell

Abrir una shell en la carpeta raíz del proyecto y escribimos:

```
cd ./Kubernetes/Script
```
### 10.2. Desplegar el cronjob del script

```
kubectl create -f script_cronjob.yaml
```
### Ejecutar el script directamente
A veces podemos querer ejecutar el script en el momento de desplegarlo, en vez de tener que esperar a la hora programada en el cronjob. Para ello podemos desplegar un job estándar para el script antes de desplegar el cronjob:
```
kubectl create -f script_job.yaml
```
**Es importante tener en cuenta que antes de desplegar el cronjob es necesario eliminar este job para evitar posibles interferencias entre ambos**
```
kubectl delete -f script_job.yaml
```
## Paso 11. Desplegar el Sistema de Recomendación
**Importante: Para llevar a cabo este paso es necesario contar con nodos con al menos 2vCPU y 16GB de RAM en el clúster**  
Para desplegar el Sistema de Recomendación y que sea accesible por la aplicación web debemos seguir los siguientes pasos:

### 11.1. Ir a la carpeta Recommender en una shell

Abrir una shell en la carpeta raíz del proyecto y escribir:

```
cd ./Kubernetes/Recommender
```
### 11.2. Desplegar el Deployment del Sistema de Recomendación  
```
kubectl create -f recommender_deployment.yaml
```  
### 11.3. Desplegar el Service del Sistema de Recomendación  
```
kubectl create -f recommender_service.yaml
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
