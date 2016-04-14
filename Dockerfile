FROM ubuntu:14.04

MAINTAINER Yi Zhang <beingzy@gmail.com>

RUN sudo apt-get -y update --fix-missing
    
RUN apt-get install -y \
    python3-pip \
    python-dev \
    libev4 \
    libev-dev \
    gcc \
    libxslt-dev \
    libxml2-dev \
    libffi-dev

RUN sudo apt-get install -y \ 
    build-essential gfortran

RUN sudo apt-get install -y \
    liblapack-dev \
    liblapack-doc-man \
    liblapack-doc \
    liblapack-pic \
    liblapack3 \
    liblapack-test \
    liblapack3gf \
    liblapacke \
    liblapacke-dev

# add project
ADD . /

# install dependency
RUN pip3 install -r requirements.txt

# add project
ADD . /

# expose the port for the API
EXPOSE 5000

# run the API
CMD ["python3", "./main/predict_api.py"]