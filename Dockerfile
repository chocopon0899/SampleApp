FROM default-route-openshift-image-registry.apps-crc.testing/project1/wasliberty
COPY --chown=1001:0 ./target/SampleApp.war /config/dropins/
