# 1.- Desplegar la base de datos MySQL

Para que los comandos indicados a continuación funcionen correctamente debemos posicionarnos en la carpeta /AppWebTFG/Kubernetes/MySQL

## 1.1- Crear el Volumen Persistente

Este volumen es necesario para que los datos almacenados en la base de datos MySQL no se pierdan al reiniciar el contenedor o el deployment

```
kubectl create -f persistence_volume.yaml
```

## 1.2- Crear el Volume Claim para el volumen persistente

```
kubectl create -f pv_claim.yaml
```

## 1.3- Desplegar el Deployment MySQL

```
kubectl create -f mysql_deployment.yaml
```

## 1.4- Desplegar el Servicio MySQL

```
kubectl create -f mysql_service.yaml
```

## Acceder a la base de datos MySQL con un pod cliente

Esto puede ser muy útil para cargar dumps, comprobar que los datos se guardan correctamente y acceder a logs de errores.

```
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppass
	
```

# 2.- Desplegar la aplicación web

Para que los comandos indicados a continuación funcionen correctamente debemos posicionarnos en la carpeta /AppWebTFG/Kubernetes/App

## 2.1- Desplegar el Deployment de la App

```
kubectl create -f webapp-deployment.yaml
```

## 2.2- Desplegar el Servicio de la App

```
kubectl create -f webapp_service.yaml
```

Minikube no soporta balanceadores de carga por lo que para poder conectarnos a la aplicación web desde fuera del cluster usaremos este servicio. Para descubrir
su URL podemos usar el siguiente comando:

```
minikube service webapp-service --url
```

Este servicio será sustituido por un balanceador de carga en la instancia de google cloud de producción que permita acceder por IP y nombre de dominio.

