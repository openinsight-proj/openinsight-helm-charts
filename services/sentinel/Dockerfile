ARG SENTINEL_VERSION=1.8.4
FROM eclipse-temurin:11-jre

WORKDIR /app/


ENV JAVAOPTS="-Dserver.port=34001 -Dcsp.sentinel.dashboard.server=localhost:34001 -Dproject.name=sentinel-dashboard"

RUN set -ex; \
    curl -L -O https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar;

EXPOSE 34001

ENTRYPOINT java $JAVAOPTS -jar sentinel-dashboard-${SENTINEL_VERSION}.jar
