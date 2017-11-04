## Anaconda3 5.0.1
-----
### Pull image
```
docker pull izone/anaconda
```
### Run
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

### Build
```
docker build -t izone/anaconda .
```
### Access Browser
```
http://localhost:8888/
```
