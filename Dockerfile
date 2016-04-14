# FROM ubuntu:14.01
FROM walberla/buildenv-ubuntu-python3

MAINTAINER Yi Zhang 

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    apt-utils \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git

# install pip3
RUN apt-get install -y python3-pip

# download anaconda3 and install
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda3-4.0.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda3-4.0.0-Linux-x86_64.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

# add conda
ENV PATH /opt/conda/bin:$PATH

# install dependency
# ADD ./requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt
RUN apt-get install -y python-numpy python-scipy  
RUN pip install scikit-learn  
RUN pip install flask-restful

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# add project
ADD . /

# expose the port for the API
EXPOSE 5000

# run the API
# CMD python ./main/knn_predict.py