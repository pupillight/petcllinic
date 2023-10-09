# syntax=docker/dockerfile:1
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ ./.mvn

COPY pom.xml mvnw ./

RUN ./mvnw dependency:resolve

COPY src ./src

# CMD ["./mvnw", "spring-boot:run"]
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]
