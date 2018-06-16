FROM arm32v7/debian:stretch-slim
MAINTAINER Leonardo Loures <luvres@hotmail.com>

# sudo apt-get install qemu-user-static binfmt-support
# sudo update-binfmts --enable qemu-arm
# sudo update-binfmts --display qemu-arm 
# cp /usr/bin/qemu-arm-static .
COPY qemu-arm-static /usr/bin/qemu-arm-static

## References:
# https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html

ENV PATH=/opt/anaconda3/bin:$PATH \
	NOTEBOOKS_PATH=/root/notebooks

RUN \
	apt-get update \
    && apt-get install -y \
		curl git zsh \
		bzip2 \
		build-essential \
  \
  # Anaconda3
	&& ANACONDA_VERSION=5.2.0 \
	&& curl -L https://repo.continuum.io/archive/Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh \
												-o Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh \
  \
    && /bin/bash Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p /usr/local/anaconda3 \
    && ln -s /usr/local/anaconda3/ /opt/anaconda3 \
    && rm Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh \
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

