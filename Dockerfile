# Jupyter Deep Learning Notebook
FROM continuumio/anaconda3:latest

RUN apt-get -y update
RUN conda install -y jupyter
RUN pip install scikit-learn seaborn pandas tensorflow opencv-python xgboost torch pykeops
RUN wget https://github.com/jgm/pandoc/releases/download/2.17.1.1/pandoc-2.17.1.1-1-amd64.deb
RUN dpkg -i pandoc-2.17.1.1-1-amd64.deb
RUN apt-get install -y texlive-xetex texlive-fonts-recommended texlive-plain-generic

RUN mkdir /sjsu

# Go into working dir /sjsu in Docker image
WORKDIR /sjsu

# copy dev host's SJSU-CMPE257-ML-Dev-Starter/ dir content to cmpe257_ml
# dir that is in the working dir of our Docker image, aka /sjsu/cmpe257_ml
COPY . ./cmpe257_ml

# start jupyter notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]