FROM openjdk:8-alpine
WORKDIR /app
COPY /tmp/addydevops-* app.jar
EXPOSE 8082
CMD ["java", "-jar", "app.jar"]
