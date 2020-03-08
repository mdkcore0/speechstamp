# depends on mdkcore0/openvino:2020.1
FROM openvino:2020.1

LABEL maintainer "Rodrigo Oliveira <mdkcore@qtrnn.io>"

RUN apt-get update && \
        apt-get install -y --no-install-recommends python3.6-dev && \
        rm -rf /var/lib/apt/lists/*

# update pip
RUN pip3 install -U pip setuptools

USER openvino
ENV OPENVINO_INSTALL_DIR /opt/intel/openvino

# install python requirements
RUN pip3 install --user \
        networkx \
        defusedxml \
        tensorflow==1.15.2

# final touches
RUN echo "source $OPENVINO_INSTALL_DIR/bin/setupvars.sh" >> /home/openvino/.bashrc
RUN echo "set -o vi" >> /home/openvino/.bashrc
RUN echo "export PATH=/home/openvino/.local/bin:$PATH" >> /home/openvino/.bashrc

# here we go!
WORKDIR /opt/src
