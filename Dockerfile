FROM maven:alpine as builder
MAINTAINER tedux <teduxi@outlook.com>

EXPOSE 5680
COPY . /opt/cs/
WORKDIR /opt/cs/
RUN mvn package

FROM openjdk:11.0.2-jre-slim
VOLUME /config
COPY --from=builder /opt/cs/target/spring-cloud-config-server.jar .
CMD ["java", "-jar", "./spring-cloud-config-server.jar", \
     "--server.port=5680", \
     "--spring.config.name=application"]