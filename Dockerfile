# Use the latest Ubuntu image
FROM ubuntu:latest

# Install Python 3.10, pip3, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Upgrade pip and install PyYAML
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir PyYAML

# Copy your Python script
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
