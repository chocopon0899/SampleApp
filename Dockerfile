FROM websphere-liberty:full-java8-ibmjava

RUN pwd
RUN ls -l

COPY ./SampleApp.war /config/dropins/