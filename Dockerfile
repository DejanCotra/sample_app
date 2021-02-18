FROM registry.access.redhat.com/ubi8/python-38

# Add application sources with correct permissions for OpenShift
USER root
COPY upload/scripts /tmp/scripts
COPY upload/src /tmp/src
RUN chown -R 1001:0 /tmp/scripts /tmp/src
USER 1001