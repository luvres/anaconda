## Anaconda3 4.4.0
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
-ti izone/anaconda jupyter notebook --allow-root --ip='*' --no-browser --notebook-dir=$NOTEBOOKS_PATH
```

### Build
```
docker build -t izone/anaconda .
```
