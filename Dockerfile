FROM ubuntu:12.04

RUN apt-get -y update fix-missing
RUN apt-get install -y python3-pip python-dev libev4 libev-dev gcc libxslt-dev libxml2-dev libffi-dev vim curl
RUN apt-get install --upgrade pip3

# install dependency
RUN python3 -r requirements.txt

# add project
ADD . /

# expose the port for the API
EXPOSE 5000

# run the API
CMD [""]