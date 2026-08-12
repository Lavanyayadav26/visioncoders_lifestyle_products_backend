FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY backend/pom.xml backend/
COPY backend/src backend/src
WORKDIR /app/backend
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/backend/target/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx256m", "-Xms128m", "-jar", "app.jar"]
