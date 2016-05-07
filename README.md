## Introduction
This is an implementation of dockerized classifier-backed web API. The underlying
service provides a prediction based on iris information to predict which species
it belongs to. 

The project is inspired by the tutorial: http://www.datadan.io/containerized-data-science-and-engineering-part-2-dockerized-data-science/

### build a docker container
set the working directory as the folder which Dockerfile resides, before executing
the following command.
```bash
docker build --force-rm=true -tag container_name .
```

### fire up the container as a service
```bash
docker run --net host --p 5000:5000 --name service_name container_name
```

## example for querying the api
http://deploy_ip_address:5000/prediction?slength=1.5&swidth=0.7&plength=1.3&pwidth=0.3
* replace: deploy_ip_address with your deployment location