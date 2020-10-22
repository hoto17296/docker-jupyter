FROM jupyter/scipy-notebook

LABEL org.opencontainers.image.source https://github.com/hoto17296/docker-jupyter

USER root
ENV GRANT_SUDO 1

# Launch Jupyter Lab
ENV JUPYTER_ENABLE_LAB 1

# Install Japanese Font
RUN apt-get update \
 && apt-get install -y fonts-takao-gothic \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/ \
 && rm -f /home/jovyan/.cache/matplotlib/font*

# Add custom config
ADD jupyter_notebook_config.py /home/jovyan/.jupyter/
ADD matplotlibrc /home/jovyan/.config/matplotlib/matplotlibrc

# Support Google Colaboratory
RUN pip install jupyter_http_over_ws \
 && jupyter serverextension enable --py jupyter_http_over_ws

# Fix permission
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/ \
 && chown -R jovyan:users /home/jovyan/.jupyter
