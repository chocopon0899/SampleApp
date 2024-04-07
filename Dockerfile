FROM --platform=linux/amd64 websphere-liberty:full-java8-ibmjava
COPY ./SampleApp.war /config/dropins/