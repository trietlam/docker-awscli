FROM node:10.16

# Install curl
RUN apt-get update -y && \
    apt-get install apt-utils -y && \
    # install required packaged by awsebcli
    apt-get install \
    build-essential zlib1g-dev libssl-dev libncurses-dev \
    libffi-dev libsqlite3-dev libreadline-dev libbz2-dev -y

# install awsebcli
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git && \
    ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

RUN echo 'export PATH="/root/.ebcli-virtual-env/executables:$PATH"' >> ~/.bashrc

# Install awscli and awsebcli with pip
RUN apt-get install python3 -y && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip3 install awscli --upgrade