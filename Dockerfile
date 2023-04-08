FROM openjdk:8-alpine
WORKDIR /app
COPY target/addydevops-1.0.1.war app.jar
EXPOSE 8082
CMD ["java", "-jar", "app.jar"]
