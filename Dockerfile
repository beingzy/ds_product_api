FROM beingzy/ds-env-py3-r

MAINTAINER Yi Zhang <beingzy@gmail.com>

# add project
ADD . /
WORKDIR .

# expose the port for the API
EXPOSE 5000

# run the API
CMD ["ls"]
CMD ["python3", "./test_web_app.py"]