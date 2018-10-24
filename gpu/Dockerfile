FROM izone/amdgpu
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV JAVA_HOME=/opt/jdk \
    JU_HOME=/opt/julia \
    NOTEBOOKS_PATH=/root/notebooks
ENV PATH=${PATH}:/opt/anaconda3/bin:${JAVA_HOME}/bin:${JAVA_HOME}/sbin:${JU_HOME}/bin

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
		ggplot \
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
    && julia -e 'Pkg.add("IJulia")' \
  \
  # Java
	&& JAVA_VERSION_MAJOR=8 && \
    JAVA_VERSION_MINOR=191 && \
    JAVA_VERSION_BUILD=12 && \
    JAVA_PACKAGE=jdk && \
    URL=2787e4a523244c269598db4e85c51e0c && \
    curl -jkSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${URL}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    | tar -xzf - -C /usr/local \
    && ln -s /usr/local/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk \
    && rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/bin/jjs \
           /opt/jdk/jre/bin/orbd \
           /opt/jdk/jre/bin/pack200 \
           /opt/jdk/jre/bin/policytool \
           /opt/jdk/jre/bin/rmid \
           /opt/jdk/jre/bin/rmiregistry \
           /opt/jdk/jre/bin/servertool \
           /opt/jdk/jre/bin/tnameserv \
           /opt/jdk/jre/bin/unpack200 \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/lib/ext/nashorn.jar \
           /opt/jdk/jre/lib/oblique-fonts \
           /opt/jdk/jre/lib/plugin.jar \
           /tmp/* /var/cache/apt/* \
  \
  # Spark
	&& SPARK_VERSION=2.3.2 \
	&& curl http://mirror.nbtelecom.com.br/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz | tar -xzf - -C /usr/local/ \
    && ln -s /usr/local/spark-${SPARK_VERSION}-bin-hadoop2.7/ /opt/spark \
  \
  # jdbc
    && curl -L https://github.com/luvres/jdbc/raw/master/mysql-connector-java-8.0.13-bin.jar \
                                                -o /opt/spark/jars/mysql-connector-java-8.0.13-bin.jar \
    && curl -L https://github.com/luvres/jdbc/raw/master/mariadb-java-client-2.3.0.jar \
                                                -o /opt/spark/jars/mariadb-java-client-2.3.0.jar \
    && curl -L https://github.com/luvres/jdbc/raw/master/ojdbc7.jar \
                                                -o /opt/spark/jars/ojdbc7.jar \
    && curl -L https://github.com/luvres/jdbc/raw/master/ojdbc6.jar \
                                                -o /opt/spark/jars/ojdbc6.jar \
    && curl -L https://github.com/luvres/jdbc/raw/master/postgresql-42.2.5.jar \
                                                -o /opt/spark/jars/postgresql-42.2.5.jar
           
ENV SPARK_HOME=/opt/spark \
    PYSPARK_PYTHON=python3 \
    PYSPARK_DRIVER_PYTHON=ipython \
    PYSPARK_DRIVER_PYTHON_OPTS="notebook --allow-root --ip='*' \
										 --no-browser \
										 --notebook-dir=$NOTEBOOKS_PATH \
										 --NotebookApp.token=''"

ENV PATH=${PATH}:${SPARK_HOME}/bin:${SPARK_HOME}/sbin 
 

WORKDIR $NOTEBOOKS_PATH

# Jupyter Notebook port
EXPOSE 8888

# Spark management ports
EXPOSE 4040 8080
