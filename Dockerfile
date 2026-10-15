FROM eclipse-temurin:17-jre-jammy
VOLUME /tmp
COPY target/devOpsDemo-0.0.1-SNAPSHOT.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
EXPOSE 2222
