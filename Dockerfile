FROM websphere-liberty:latest
COPY --chown=1001:0 ./target/SampleApp.war /config/dropins/
