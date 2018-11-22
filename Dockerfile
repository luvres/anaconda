FROM ubuntu:xenial
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV JU_HOME=/opt/julia \
    NOTEBOOKS_PATH=/root/notebooks
ENV PATH=${PATH}:/opt/anaconda3/bin:${JU_HOME}/bin

RUN \
	apt-get update \
	&& apt-get install -y \
		curl git zsh \
		bzip2 \
		build-essential \
  \
    && apt-get install --no-install-recommends -y \
        texlive \
        texlive-xetex \
        texlive-generic-recommended \
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
		celery \
		requests_oauthlib \
        twython \
        nltk \
	  \
		msgpack \
		git+https://github.com/pydata/pandas-datareader.git \
		ggplot pygal plotly \
      \
		tensorflow \
  \
	&& mkdir $NOTEBOOKS_PATH \
  \
  # R packages
    && conda install \
        r-base r-irkernel \
        r-caret \
  \
  # C++
    && conda install -c QuantStack -c conda-forge xeus-cling \
  \
  # Julia
    && JULIA_V=0.7 \
    && JULIA_VERSION=0.7.0 \
    && JULIA_PATH=/usr/local/julia-${JULIA_VERSION} \
    && mkdir $JULIA_PATH \
    && curl https://julialang-s3.julialang.org/bin/linux/x64/${JULIA_V}/julia-${JULIA_VERSION}-linux-x86_64.tar.gz | tar -xzf - -C ${JULIA_PATH} --strip-components 1 \
    && ln -s $JULIA_PATH /opt/julia \
    && sed -i 's/# end aliases/alias j="julia"\n# end aliases/' $HOME/.bashrc \
    && julia -e 'Pkg.add("IJulia")'

    
WORKDIR $NOTEBOOKS_PATH

# Jupyter Notebook port
EXPOSE 8888
