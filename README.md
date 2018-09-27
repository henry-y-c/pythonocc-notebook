# pythonocc-notebook

A pythonocc docker image with Python 3 Jupyter Notebook on Debian

[Docker Hub link](https://hub.docker.com/r/henryc/pythonocc-notebook/)

## Usage

```
$ docker run --rm -it -p 8080:8888 -v /absolute/path/to/notebook/dir:/opt/notebooks henryc/pythonocc-notebook:0.1.2
```

- If you want to run the jupyter notebook using another port on your host OS, change the port number 8080.

- The path for volume mounting should be absolute path.
