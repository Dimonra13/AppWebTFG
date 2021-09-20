## Configuration required for running locally
To deploy the application in a Cloud provider, such as AWS, using a Load Balancer with HTTPS, some configuration lines have been added in the AppWebTFG/grails-app/conf/application.groovy file to tell the Spring Security Plugin to perform the redirections through HTTPS using port 443.   
Because of this the application will not be able to run correctly locally since we do not have a local Load Balancer, so for development and local execution it is necessary to comment those lines.
