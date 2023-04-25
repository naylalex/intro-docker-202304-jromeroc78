FROM ubuntu AS build
RUN apt-get update
RUN apt-get install -y maven openjdk-8-jdk
COPY . .
RUN mvn verify
FROM openjdk:8-jre-alpine
COPY --from=build target/words.jar .
CMD ["java", "-Xmx8m", "-jar", "words.jar"]
