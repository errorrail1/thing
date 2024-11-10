# Use an official Ubuntu base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    firefox \
    xvfb \
    wget \
    unzip \
    curl \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libgdk-pixbuf2.0-0 \
    libasound2 \
    libnss3 \
    libx11-xcb1 \
    && rm -rf /var/lib/apt/lists/*

# Set up a default environment variable for Xvfb display number
ENV DISPLAY=:99

# Run Xvfb in the background and then run Firefox in headless mode
CMD Xvfb $DISPLAY -screen 0 1280x1024x24 & firefox --headless --width=1280 --height=1024 --remote-debugging-port=9222
