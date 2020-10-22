# docker-jupyter
My Jupyter Lab Docker image.

## Usage
``` console
$ docker run --rm -it \
    -p 127.0.0.1:8888:8888 \
    -v $(pwd):/home/jovyan/work \
    ghcr.io/hoto17296/jupyter
```
