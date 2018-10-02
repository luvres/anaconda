## Anaconda3 5.2.0
### PySpark - spark 2.
### GPU - NVIDIA and AMDGPU (RX 550)
-----

### Pull image
```
docker pull izone/anaconda
```
### Run Jupyter Notebook
```
docker run --rm --name Anaconda -h anaconda \
-p 8888:8888 \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda jupyter notebook \
	--allow-root --ip='*' \
	--no-browser \
	--notebook-dir=$NOTEBOOKS_PATH \
	--NotebookApp.token=''
```
##### Background
```
docker run -d --name Anaconda -h anaconda \
--restart always \
-p 8888:8888 \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda jupyter notebook \
	--allow-root --ip='*' \
	--no-browser \
	--notebook-dir=$NOTEBOOKS_PATH \
	--NotebookApp.token=''
```

#### PySpark Notebook
```
docker run --rm --name Anaconda-GPU -h anaconda \
--device /dev/dri \
-p 8888:8888 \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda:spark pyspark
```

#### PySpark GPU Notebook
```
docker run --rm --name Anaconda-GPU -h anaconda \
--device /dev/dri \
-p 8888:8888 \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda:gpu pyspark
```


### Access Browser
```
http://localhost:8888/
```
### Build
```
docker build -t izone/anaconda .
```
```
docker build -t izone/anaconda:spark ./spark/
```
```
docker build -t izone/anaconda:gpu ./gpu/
```

