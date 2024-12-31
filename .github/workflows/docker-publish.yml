name: Confirm Architecture

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Set DOCKER_DEFAULT_PLATFORM
        run: echo "DOCKER_DEFAULT_PLATFORM=linux/arm64" >> $GITHUB_ENV

      - name: Build and run Docker image
        run: |
          docker build -t architecture-checker -<<EOF
          FROM --platform=linux/arm64 debian:bookworm
          RUN uname -m
          EOF
          docker run architecture-checker
