# Como desplegar la aplicación web en DigitalOcean usando kubernetes paso a paso

## Introducción

DigitalOcean es un host para desplegar aplicaciones con kubernetes. Debido a que es un sistema de hosting centrado en esta tecnología proporciona una serie
de servicio muy interesantes, entre los que destacan:

* Un dashboard interactivo para la gestión y creación de clusters
* Métricas sobre el estado del cluster y los nodos integradas en el dashboard de gestión del cluster
* Un servicio de creación y gestión de load balancers
* La posibilidad de gestionar diferentes nombres de dominio

Además, presenta una gran ventaja frente a otros sistemas de hosting kubernetes, su coste. DigitalOcean ofrece costes mucho más reducidos y transparentes que
otros servicios como AWS EKS y permite incrementar o reducir los recursos rápidamente de forma que se paga solo por lo que se utiliza.

## Aplicaciones necesarias

Para desplegar una aplicación en DigitalOcean es necesario:

* Instalar doctl, la herramienta desarrollada por DigitalOcean para facilitar la conexión de kubectl con el cluster
* Instalar kubectl (la versión debe coincidir con la usada en el cluster)

## Paso 1. Crear un Cluster

Para crear el cluster usaremos el dashboard destinado para ello en DigitalOcean y seguiremos los siguientes pasos:

1.- Seleccionar la versión de kubectl a usar en el cluster y la región en la que se desea tener el cluster  
![Cluster-1](https://i.imgur.com/xbo0VEv.png)  
**Importante tener en cuenta que en las versiones más recientes de kubectl disponibles en Digital Ocean no suele funcionar correctamente el Metrics Server, por tanto se recomienda no usar la versión (latest) a menos que este disponible una subversión superior a la 1.x.3 (en la cual suelen arreglar este problema).**  
  
2.- Seleccionar el tipo de nodos y la cantidad de ellos que se necesitan (a mayor cantidad de nodos y prestaciones de estos mayor precio)  
![Cluster-2](https://i.imgur.com/ZHyfPqr.png)  
3.- Establecer el nombre del cluster y los tags (estos tags pueden ser útiles si se tienen que gestionar varios cluster)  
![Cluster-3](https://i.imgur.com/Q2u5uv1.png)  

## Paso 2. Vincular kubectl al cluster usando doctl

En este paso instalaremos la versión apropiada de kubectl y la conectaremos al cluster usando doctl de forma que podamos desplegar la app y controlar el cluster 
desde la consola de nuestro ordenador. Para ello seguiremos los siguientes pasos:

1.- Instalar kubectl de la página oficial. https://kubernetes.io/docs/tasks/tools/install-kubectl/  
**Importante tener en cuenta que debe ser la misma versión que la seccionada al crear el cluster.**  
2.- Instalar doctl desde la página oficial. https://github.com/digitalocean/doctl#installing-doctl  
3.- Conectar kubectl al cluster usando doctl mediante el comando: doctl kubernetes cluster kubeconfig save [id]  
**El certificado usado para esto caduca cada 7 días, así que es necesario usar este comando periódicamente para mantener el acceso al cluster.**  

## Paso 3. Instalar el Kubernetes Metrics Server

El Kubernetes Metrics Server permite instalar en el cluster servicios muy importantes como el vertical autoscaler que se encarga de gestionar la cantidad de vCPU y RAM necesaria para los diferentes pods.

Para desplegar el metric server en el cluster es suficiente con usar el comando:

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.4.4/components.yaml
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
NAME                                       READY   STATUS    RESTARTS   AGE
metrics-server-68b849498d-z4jxd            1/1     Running   0          31s
vpa-admission-controller-6cd546c4f-8pr7l   1/1     Running   0          5s
vpa-recommender-6855ff754-44vj9            1/1     Running   0          6s
vpa-updater-9fd7bfbd5-skwxd                1/1     Running   0          7s

```

IMPORTANTE: Para poder ejecutar este paso es necesario tener instalado OpenSSL 1.1.1 y tener la ruta del archivo en el PATH. Como en Windows puede dar problemas puede usarse la version 0.8 que no necesita OpenSSL. Puede descargarse en la siguiente ruta: https://github.com/kubernetes/autoscaler/tree/vpa-release-0.8.git  
**Es muy recomendable realizar este paso en linux si es posible para evitar problemas.**

Para desinstalar el Vertical Pod Autoscaler puede usarse el siguiente comando:
```
./hack/vpa-down.sh
```
## Paso 5. Desplegar la base de datos MySQL  

Para desplegar la base de datos dentro del clúster debemos seguir los siguientes pasos:  

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
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -per94tm31iyhW
	
```
## Paso 6. Añadir un nombre de dominio a Digital Ocean  
**En caso de tener ya un nombre de dominio vinculado a Digital Ocean para el proyecto actual ir al paso 7 directamente.**  
Los nombres de dominio son muy importantes ya que permiten a los usuarios encontrar la página web sin necesidad de conocer la IP del servidor en que se encuentra.
Esto es posible gracias a los servidores DNS,que se encargan de hacer la traducción IP-Dominio, por lo que deberemos configurar estos DNS para que dirijan el 
tráfico hacia nuestro cluster. Además, el tener un nombre de dominio es fundamental para poder usar HTTPS y SSL. Para establecer el nombre de dominio de nuestra 
aplicación en Digital Ocean seguiremos los siguientes pasos:  

1.- Ir a la sección Networking  
2.- En la sección networking, ir a Domains  
3.- Poner el nombre de dominio y pulsar en "Add Domain"
![Domain-1](https://i.imgur.com/EoYCVFE.png)
**Es importante tener en cuenta que Digital Ocean no es un Domain Registar por lo que es necesario comprar el dominio en alguno de los Domain Registars existentes**  
4.- https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars 

## Paso 7. Crear el certificado SSL
**En caso de tener ya un certificado SSL vinculado a Digital Ocean para el proyecto actual ir al paso 8 directamente.**   
Los certificados SSL son vitales para el establecimiento de conexiones seguras a través de Internet siguiendo el protocolo HTTPS. Muchos navegadores presentan advertencias a sus usuarios si intentan acceder a sitios web que no utilizan este protocolo. Estas advertencias pueden reducir notablemente el número de usuarios que decidan utilizar Coursing.me y la satisfacción de los mismos. Ante esto, tanto por una cuestión de seguridad como de imágen es vital contar con un certificado SSL y usar HTTPS. Para crear un certificado SSL en Digital Ocean usando Let’s Encrypt seguiremos los siguientes pasos:

1.- Ir a la sección Settings  
2.- En la sección Settings, ir a Security  
![Cert-1](https://i.imgur.com/C4eHSDm.png)  
3.- Pulsar en el botón "Add Certificate" 
![Cert-2](https://i.imgur.com/DEihcFr.png)  
4.- Seleccionar el dominio previamente añadido y un nombre para el certificado 
![Cert-3](https://i.imgur.com/CbRoC03.png)  
5.- Pulsar en el botoń "Generate Certificate"   
**En caso de contar ya con un certificado SSL puede importarse en Digital Ocean en la pestaña "Bring your own certificate"**
![Cert-3](https://i.imgur.com/exhJF50.png)  

## Paso 8. Desplegar la aplicación web

Para desplegar la aplicación web y que sea accesible desde el exterior del cluster debemos seguir los siguientes pasos:

### 8.1. Ir a la carpeta App en una shell

Abrir una shell en la carpeta raíz del proyecto y escribir:

```
cd ./Kubernetes/App
```
### 8.2. Desplegar el Deployment de la App

```
kubectl create -f webapp_deployment.yaml
```

### 8.3. Desplegar el Load Balancer de la App

Los load balancer permiten que la aplicación sea accesible a través de internet y reparten el tráfico entre los diferentes nodos y pods de la aplicación
en función de la tasa de uso que tenga cada uno. El load balancer que crearemos mediante el archivo yaml será detectado por DigitalOcean y se integrará con su propio servicio de load balancing, permitiéndonos aprovechar al máximo los servicios que nos ofrece este proveedor.

```
kubectl create -f webapp_loadBalancer.yaml
```
## Paso 9. Desplegar el Horizontal Pod Autoscaler

El Horizontal Pod Autoscaler se encarga de aumentar o disminuir el número de pods de un deployment en función del tráfico que le llega, de forma que junto 
con el vertical autoscaler se encargan de que el número de replicas y la CPU y RAM de cada réplica sean las justas y necesarias. Por tanto, son muy importantes a 
la hora de garantizar la disponibilidad y reducir costes. Para desplegar un Horizontal Pod Autoscaler para el deployment de nuestra aplicación es suficiente con 
usar el comando:  
```
kubectl autoscale deployment webapp --cpu-percent=80 --min=1 --max=3
```

**Para probar el Horizontal Pod Autoescaler pueden usarse los siguiente comando (debe ejecutarse en una shell nueva):**
```
kubectl run -it --rm load-generator --image=busybox /bin/sh --generator=run-pod/v1
```
Cuando aparezca un prompt se debe escribir el siguiente programa para que genere tráfico en nuestro deployment y el Autoscaler se active:
```
while true; do wget -q -O- URL_APP; done
```
En otra shell podemos usar siguiente comando para comprobar el número de réplicas y el porcentaje de CPU usado de cada réplica:
```
kubectl get hpa
```
La salida esperada debe ser similar a:
```
NAME     REFERENCE           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   1%/80%    1         3         1          57s
```
```
NAME     REFERENCE           TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   134%/80%   1         3         3          105s
```
```
NAME     REFERENCE           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
webapp   Deployment/webapp   0%/80%    1         3         1          12m
```
Una vez comprobado que funciona, usamos Ctrl+C en la shell para dejar de generar tráfico, cerramos la shell y en nuestra shell original usamos el siguiente
comando para eliminar el generador de carga:
```
kubectl delete pod load-generator
```
**Para eliminar el Horizontal Pod Autoscaler se puede usar el comando:**
```
kubectl delete horizontalpodautoscaler.autoscaling/webapp
```
**Tanto el paso 4 como este paso 9, aunque son muy recomendables e importantes por las razones ya dichas, son opcionales. La aplicación puede funcionar correctamente sin ningún autoscaler, aunque no se podrá garantizar su disponibilidad en caso de que se produzca un pico de tráfico.**
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
## Eliminar el cluster y el load balancer  
Para eliminar el cluster y el load balancer de forma que no consuman recursos y no se incurra en costes se deben seguir los siguientes pasos:  
1.- En la sección de Networking/Load Balancers, pulsar "More" en el load balancer que se desea borrar y seleccionar "Destroy"
![Destroy-1](https://i.imgur.com/DDfmiOd.png)  
2.- En la sección de Kubernetes, pulsar "More" en el cluster que se desea borrar y selccionar "Destroy"
![Destroy-2](https://i.imgur.com/aCYLOQA.png)  
