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
  && echo -e "\nfont.family: TakaoPGothic" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())') \
  && rm -f ~/.cache/matplotlib/font*

# Support Google Colaboratory
RUN pip install jupyter_http_over_ws \
  && jupyter serverextension enable --py jupyter_http_over_ws

# Add custom config
ADD jupyter_notebook_config.py /tmp
RUN cat /tmp/jupyter_notebook_config.py >> /etc/jupyter/jupyter_notebook_config.py \
  && rm -f /tmp/jupyter_notebook_config.py