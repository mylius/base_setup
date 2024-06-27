FROM --platform=linux/amd64 ubuntu:noble

# Install necessary packages including sudo
RUN apt-get update \
    && apt-get install -y \
        sudo \
        python3-apt \
        ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user 'zufall' with root privileges
RUN useradd --create-home --shell /bin/bash zufall \
    && echo "zufall ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
     
# Switch to the 'zufall' user
USER zufall
WORKDIR /home/zufall

# Set default command to print Ansible version
CMD ["ansible", "--version"]
