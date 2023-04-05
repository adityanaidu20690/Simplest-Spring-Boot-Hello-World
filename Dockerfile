FROM openjdk:8-alpine
WORKDIR /app
COPY target/addydevops-1.0.0-SNAPSHOT.war app.jar
EXPOSE 8082
CMD ["java", "-jar", "app.jar"]
