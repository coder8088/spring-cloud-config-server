FROM gradle:5.2.1-jdk11-slim as builder
MAINTAINER tedux <teduxi@outlook.com>

COPY . /opt/cs/
WORKDIR /opt/cs/
RUN gradle -g /var/cache/gradle --no-daemon --console plain -Dfile.encoding=UTF-8 build -x test

FROM openjdk:11.0.2-jre-slim
EXPOSE 5680
COPY --from=builder /opt/cs/build/libs/*.jar /config-server.jar
ENV JAVA_TOOL_OPTIONS -Duser.timezone=Asia/Shanghai -Xmx=128m -XX:+UseG1GC
CMD ["java", "-jar", "/config-server.jar", \
     "--server.port=5680", \
     "--spring.config.location=/config/application.yml"]