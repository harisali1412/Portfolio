FROM ubuntu:22.04

# Install basic dependencies and shell
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    git \
    bash \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.0-stable.tar.xz && \
    tar xf flutter_linux_3.22.0-stable.tar.xz -C /usr/local/ && \
    rm flutter_linux_3.22.0-stable.tar.xz

# Set up environment variables
ENV PATH="$PATH:/usr/local/flutter/bin"

# Verify installation
RUN flutter --version

# Set default shell
CMD ["/bin/bash"]
