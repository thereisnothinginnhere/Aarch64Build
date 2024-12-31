# Use the specified base image
ARG BASE_IMAGE
ARG PLATFORM
FROM --platform=${PLATFORM} ${BASE_IMAGE}

RUN uname -m

# Install dependencies
RUN apt-get update
RUN apt-get install -y \
    git \
    cmake \
    libssl-dev \
    zlib1g-dev \
    g++ \
    gperf

# Clone the repository
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

# Build the project
WORKDIR /telegram-bot-api
RUN mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target install

# Copy the built binary to the output directory
RUN mkdir -p /output && cp /telegram-bot-api/build/telegram-bot-api /output/telegram-bot-api
