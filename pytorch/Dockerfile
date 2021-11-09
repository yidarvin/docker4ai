
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
    firefox \
    vim \
    htop \
    python3-opencv \
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

# Install Miniconda and Python 3.8
ENV PATH="/home/bmcv/miniconda3/bin:${PATH}"
ARG PATH="/home/bmcv/miniconda3/bin:${PATH}"
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /home/bmcv/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda install -y python=3.8
RUN conda clean -ya

# CUDA 11.1-specific steps
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch

# Extra Python Packages
RUN pip install opencv-python
RUN conda install -y -c conda-forge jupyterlab
RUN pip install matplotlib
RUN pip install imageio
RUN pip install pandas
RUN pip install scikit-learn
RUN pip install scikit-image
RUN pip install scipy

# PyCharm
ADD ./pycharm-community-2021.2.3.tar.gz .
ENV PATH="/home/bmcv/pycharm-community-2021.2.3/bin:${PATH}"

# VNC Desktop
COPY --chown=bmcv ./xstartup ./xstartup
COPY --chown=bmcv ./vncstartup.sh ./vncstartup.sh

CMD ["bash"]
