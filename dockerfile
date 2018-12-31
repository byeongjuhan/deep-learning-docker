FROM vipml/cuda:9.0
MAINTAINER Byeon-Ju Han <bjhan@unist.ac.kr>

# Install python 3.6 (following the guide in http://ubuntuhandbook.org/index.php/2017/07/install-python-3-6-1-in-ubuntu-16-04-lts/)
RUN apt-get install software-properties-common && \
	add-apt-repository ppa:jonathonf/python-3.6 && \
	apt-get update && \
	apt-get -y install python3.6 && \
	update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1 && \
	update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2 && \
	update-alternatives --config python3

# Install required packages
RUN apt-get -y install python3-pip \
	python3-dev \
	python3-tk \
	libgtk2.0 \
	libgtk2.0-dev \
	vim && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Install pytorch 0.4.1
RUN pip3 install https://download.pytorch.org/whl/cu90/torch-0.4.1-cp36-cp36m-linux_x86_64.whl  && \ 
    pip3 install torchvision matplotlib scipy opencv-python jupyter

WORKDIR /root
RUN wget https://github.com/byeongjuhan/deep-learning-docker/raw/master/setup_jupyter_notebook.py
