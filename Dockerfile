# Etapa de build
FROM maven:3.8.5-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests

# Etapa de execução
FROM openjdk:17-jdk-slim
COPY --from=build /target/JBS-0.1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
