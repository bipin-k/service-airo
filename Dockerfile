# Use the official Gradle image to build the application
FROM gradle:8.8.0-jdk21 AS build
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . .
RUN ./gradlew bootJar --no-daemon

# Use a slim JRE image to run the application
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
