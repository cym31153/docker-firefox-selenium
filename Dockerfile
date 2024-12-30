# 基础镜像
FROM ubuntu:22.04

# 环境变量
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖
RUN apt-get update && apt-get install -y \
    wget \
    firefox \
    python3 \
    python3-pip \
    && apt-get clean

# 安装 Selenium
RUN pip3 install selenium
RUN apt-get update && apt-get install -y tar

# 下载并安装 Geckodriver (仅支持 arm64)
RUN wget -q https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-v0.33.0-linux-aarch64.tar.gz -O geckodriver.tar.gz && \
    tar -xvzf geckodriver.tar.gz && \
    mv geckodriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver.tar.gz
