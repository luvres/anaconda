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
```
```
-----
### Raspberry Pi 3
#### armhf
##### Pull image
```
docker pull izone/freecad:armhf
```
##### Run in Raspberry Pi
```
docker run --rm --name Anaconda -h anaconda \
-p 8888:8888 \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda:armhf jupyter notebook \
	--allow-root --ip='*' \
	--no-browser \
	--notebook-dir=$NOTEBOOKS_PATH \
	--NotebookApp.token=''
```
```
```
### Docker QEMU
#### armhf in amd64
```
sudo apt-get install qemu-user-static
```
#### Run
```
docker run --rm --name Anaconda -h anaconda \
-p 8888:8888 \
-v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static \
-v $HOME/notebooks:/root/notebooks \
-ti izone/anaconda:armhf jupyter notebook \
	--allow-root --ip='*' \
	--no-browser \
	--notebook-dir=$NOTEBOOKS_PATH \
	--NotebookApp.token=''
```
#### Build
```
sudo apt-get install qemu-user-static binfmt-support
sudo update-binfmts --enable qemu-arm
sudo update-binfmts --display qemu-arm 
cp /usr/bin/qemu-arm-static .
```
```
```
```
docker build -t izone/anaconda:armhf ./armhf/
```
