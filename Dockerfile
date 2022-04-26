FROM openjdk:17.0.2-jdk-slim

COPY target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]