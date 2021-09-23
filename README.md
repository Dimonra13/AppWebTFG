## Configuration required for running locally
To deploy the application in a Cloud provider, such as AWS, using a Load Balancer with HTTPS, some configuration lines have been added in the AppWebTFG/grails-app/conf/application.groovy file to tell the Spring Security Plugin to perform the redirections through HTTPS using port 443.   
Because of this the application will not be able to run correctly locally since we do not have a local Load Balancer, so for development and local execution it is necessary to comment those lines.  
It is also important to note that to run the application in the local environment it is necessary to have a MySQL server. The docker dimonra13/mysql:v1 has a preconfigured MySQL server and can be run with the following command:     
```
docker run --name=mysql -p 3306:3306 -d dimonra13/mysql:v1
```
