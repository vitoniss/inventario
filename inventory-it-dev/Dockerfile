FROM maven:3.9.16-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests


FROM tomcat:11.0.25-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /app/target/inventory-it-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/inventory-it.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
