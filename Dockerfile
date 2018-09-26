FROM henryc/jupyter-debian:0.1.1

RUN apt-get update && apt-get install -y apt-utils \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y git cmake libgl1-mesa-dev libfreetype6-dev freeglut3-dev swig \
 && cd /opt \
 && git clone https://github.com/tpaviot/oce.git \
 && git clone https://github.com/tpaviot/pythonocc-core.git \
 && cd /opt/oce && mkdir build && cd build && cmake .. && make -j$(nproc) && make install \
 && cd /opt/pythonocc-core && mkdir build && cd build && cmake .. && make && make install \
 && rm -rf /opt/oce \
 && rm -rf /opt/pythonocc-core \
 && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}
