
FROM nvidia/cuda:11.3.1-base-ubuntu20.04

# Install some basic utilities
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    wget \
    python3-opencv \
    firefox \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory
RUN adduser --disabled-password --gecos '' --shell /bin/bash bmcv
RUN echo "bmcv ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER bmcv

# All users can use /home/bmcv as their home directory
ENV HOME=/home/bmcv
RUN chmod 777 /home/bmcv
WORKDIR /home/bmcv

# Copying Over VNCserver Files
COPY ./xstartup ./xstartup
COPY ./vncstartup.sh ./vncstartup.sh

# Install Miniconda and Python 3.8
ENV PATH="/home/bmcv/miniconda3/bin:${PATH}"
ARG PATH="/home/bmcv/miniconda3/bin:${PATH}"
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /home/bmcv/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda install -y python=3.8 anaconda
RUN conda clean -ya

# CUDA 11.1-specific steps
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch

# Other Important Packages
RUN pip install opencv-python

CMD ["bash"]
