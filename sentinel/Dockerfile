FROM openjdk:11.0.15

WORKDIR /app/

COPY ./ ./
ENV JAVAOPTS "-Dserver.port=34001 -Dcsp.sentinel.dashboard.server=localhost:34001 -Dproject.name=sentinel-dashboard"
EXPOSE 34001

ENTRYPOINT java $JAVAOPTS -jar sentinel-dashboard-1.8.4.jar