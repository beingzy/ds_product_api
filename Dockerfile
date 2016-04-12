FROM ubuntu:14.01

RUN apt-get -y update --fix-missing
RUN apt-get install -y python3-pip python-dev libev4 libev-dev gcc libxslt-dev libxml2-dev libffi-dev

# install dependency
RUN apt-get install -y python-numpy python-scipy
RUN pip3 install -r requirements.txt

# add project
ADD . /

# expose the port for the API
EXPOSE 5000

# run the API
CMD ["python", "/predict_api.py"]