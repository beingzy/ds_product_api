FROM beingzy/ds-env-py3-r

MAINTAINER Yi Zhang <beingzy@gmail.com>

# add project
ADD . /

# expose the port for the API
EXPOSE 5000

# run the API
CMD ["python3", "./main/predict_api.py"]