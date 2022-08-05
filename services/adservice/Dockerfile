FROM openjdk:11.0.15 AS builder

WORKDIR /app/

COPY ./ ./
RUN chmod +x ./mvnw
RUN ./mvnw clean install package -DskipTests

# -----------------------------------------------------------------------------

FROM eclipse-temurin:11-jre

WORKDIR /app/

COPY --from=builder /app/target/adservice-springcloud-1.0-SNAPSHOT.jar ./

RUN set -ex; \
    curl -L -O https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.16.0/opentelemetry-javaagent.jar;

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317 \
    OTEL_RESOURCE_ATTRIBUTES=service.name=adservice-springcloud \
    NACOS_SERVER=localhost:8848 \
    SENTINEL_SERVER=localhost:34001 \
    JAVA_TOOL_OPTIONS=-javaagent:opentelemetry-javaagent.jar \
    JAVAOPTS=-Dspring.cloud.nacos.discovery.enabled=false -Dspring.cloud.sentinel.enabled=false

EXPOSE 8081 8999 9555

ENTRYPOINT java $JAVAOPTS -jar adservice-springcloud-1.0-SNAPSHOT.jar
