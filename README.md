# Spring Cloud Config Server
A docker image of Spring Cloud Config Server.

## Usage
```shell script
docker run -it --name=config-server \
       -p 5680:5680 \
       -v /path/to/application.yml:/config/application.yml \
       tedux/spring-cloud-config-server
```