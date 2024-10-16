FROM openjdk:11
WORKDIR /usr/app
COPY ./target/ibt-maven-1.0-SNAPSHOT.jar .
CMD ["java", "-jar", "ibt-maven-1.0-SNAPSHOT.jar"]
