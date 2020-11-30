# Usar una base de datos dockerizada MySQL para desarollo

## Iniciar la base de datos

Durante el desarollo en lugar de usar la base de datos del cluster puede usarse la imagen docker dimonra13/mysql.
 Para ello es suficiente con ejecutar el comando:

```
docker run --name=mysql -p 3306:3306 -d dimonra13/mysql:v1
```
Es importante tener en cuenta que se requiere tener Docker instalado para ejecutar este comando y que la redirección de puertos no 
está disponible en Docker Toolbox.

## Parar la base de datos

Podemos parar la ejecución de la base de datos usando el comando:
```
docker stop mysql
```

Además, podemos eliminar el contenedor usando:
```
docker rm mysql
```


