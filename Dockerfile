FROM image-registry.openshift-image-registry.svc:5000/project1/wasliberty
COPY --chown=1001:0 ./source/target/SampleApp.war /config/dropins/
