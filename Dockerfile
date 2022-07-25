FROM openjdk:11.0.15 AS builder

WORKDIR /app/

COPY ./ ./
RUN chmod +x ./mvnw
RUN ./mvnw clean install package

# -----------------------------------------------------------------------------

FROM openjdk:11-slim-buster
WORKDIR /app/
COPY --from=builder /app/target/adservice-springcloud-1.0-SNAPSHOT.jar ./
COPY --from=builder /app/agent/opentelemetry-javaagent.jar ./

EXPOSE 8081
EXPOSE 8999
EXPOSE 9555

ENV OTEL_EXPORTER_OTLP_TRACES_ENDPOINT http://localhost:4317
ENV OTEL_RESOURCE_ATTRIBUTES service.name=adservice-springcloud
ENV NACOS_SERVER localhost:8848
ENV SENTINEL_SERVER localhost:34001
ENV JAVAOPTS -Dspring.cloud.nacos.discovery.enabled=false -Dspring.cloud.sentinel.enabled=false
ENTRYPOINT java -javaagent:opentelemetry-javaagent.jar $JAVAOPTS -jar adservice-springcloud-1.0-SNAPSHOT.jar
