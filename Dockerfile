FROM --platform=linux/amd64 websphere-liberty:full-java8-ibmjava
COPY build/SampleApp.war /config/dropins/
