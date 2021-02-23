FROM registry.access.redhat.com/ubi8/python-38

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD app.py /tmp/src/
ADD requirements.txt /tmp/src/
RUN chown -R 1001:0 /tmp/src
RUN yum install -y mesa-libGL
RUN pip3 install --extra-index-url https://google-coral.github.io/py-repo/ tflite_runtime
#RUN yum install cmake
#RUN yum install boost-devel
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
