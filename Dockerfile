FROM --platform=linux/amd64 websphere-liberty:24.0.0.3-full-java8-ibmjava
COPY --chown=1001:0 ./target/SampleApp.war /config/dropins/
