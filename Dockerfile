# Jupyter Deep Learning Notebook
FROM continuumio/anaconda3:latest

RUN conda install -y jupyter

RUN mkdir /sjsu

# Go into working dir /sjsu in Docker image
WORKDIR /sjsu

# copy dev host's SJSU-CMPE257-ML-Dev-Starter/ dir content to cmpe257_ml
# dir that is in the working dir of our Docker image, aka /sjsu/cmpe257_ml
COPY . ./cmpe257_ml

# start jupyter notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]