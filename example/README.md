# Usage

## Docker Compose

Install [docker toolkits](https://docs.docker.com/docker-for-mac/install/) for Mac.

For detailed instructions on how to install on other environments such as Windows or Linux, or for simpler instructions for installing on a Mac, click for instructions [here](http://www.sunlab.org/teaching/cse6250/spring2018/lab/environment/).

Create a file named as `docker-compose.yml` with content

```
version: '3'

services:
  jupyter-server:
    image: sunlab/easypy:latest
    ports:
      - 8888:8888
    restart: always
    volumes:
      - ./data:/work/data
    environment:
      - CONTAINER=docker

```

Start container using command: `docker-compose up -d`

This command will start a daemon service here.

And then, visit <http://localhost:8888/> for your Jupyter.

Here are a few useful commands:

```
docker-compose up -d --force-recreate # force recreate container
docker-compose stop # Stop services

docker-compose logs # Check logs
docker-compose logs -f # Check Logs and keep watching

docker-compose pull # Pull service images
docker-compose down # Stop and remove containers, networks, images, and volumes
docker-compose up -d --build # rebuild image, it is useful if you are using local context

docker-compose help # Display All Options
```



## Data Files

Please place the related [MIMIC-III](https://mimic.physionet.org/gettingstarted/dbsetup/) CSVs to `data/` folder.

Currently this project requires `ADMISSIONS.csv`, `DIAGNOSES_ICD.csv` and `PATIENTS.csv`.




