# docker-jupyter
My Jupyter Lab Docker image.

## Run Jupyter Lab
``` console
$ docker run --rm -it \
    -p 127.0.0.1:8888:8888 \
    -v $(pwd):/home/jovyan/work \
    ghcr.io/hoto17296/jupyter
```

## Build and Push Image
``` console
$ docker pull jupyter/scipy-notebook
$ docker build -t ghcr.io/hoto17296/jupyter .
$ docker push ghcr.io/hoto17296/jupyter
```