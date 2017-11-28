FROM debian:jessie-slim
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV PATH=/opt/anaconda2/bin:$PATH \
	NOTEBOOKS_PATH=/root/notebooks

RUN \
	apt-get update \
    && apt-get install -y \
		curl \
		bzip2 \
		build-essential \
  \
  # Anaconda2
	&& ANACONDA_VERSION=5.0.1 \
	&& curl -L https://repo.continuum.io/archive/Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh \
												-o Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh \
  \
    && /bin/bash Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p /usr/local/anaconda2 \
    && ln -s /usr/local/anaconda2/ /opt/anaconda2 \
    && rm Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh \
  \
	&& pip install --upgrade pip \
    && pip install \
		mrjob \
		shapely \
		selenium \
		termcolor \
		scrapy \
		js2xml \
  \
	&& mkdir $NOTEBOOKS_PATH

WORKDIR $NOTEBOOKS_PATH

# Jupyter Notebook port
EXPOSE 8888

