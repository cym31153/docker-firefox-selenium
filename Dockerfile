# 使用官方的 Ubuntu 基础镜像
FROM ubuntu:22.04

# 避免交互式安装问题
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的工具
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    firefox \
    curl \
    python3 \
    python3-pip \
    && apt-get clean

# 安装 Selenium 和 geckodriver
RUN pip3 install selenium
RUN wget -q https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-v0.33.0-linux64.tar.gz \
    && tar -xvzf geckodriver-v0.33.0-linux64.tar.gz \
    && mv geckodriver /usr/local/bin/ \
    && chmod +x /usr/local/bin/geckodriver \
    && rm geckodriver-v0.33.0-linux64.tar.gz

# 设置默认工作目录
