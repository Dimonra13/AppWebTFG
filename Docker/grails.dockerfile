FROM openjdk:8-jre
RUN mkdir /usr/app
COPY /build /usr/app
WORKDIR /usr/app/libs
EXPOSE 8080
CMD [ "java", "-jar", "AppWebTFG-0.1.war" ]
