FROM node:10.16

#Install curl
RUN apt-get update -y && \
    apt-get install apt-utils -y && \
    apt-get install zip -y && \
    # # Install awscli with pip
    apt-get install python3 -y && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip3 install awscli --upgrade