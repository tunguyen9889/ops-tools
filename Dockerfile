FROM alpine:3.19

MAINTAINER mr.anhtu9889@gmail.com

RUN set -ex \
    && apk add --virtual --update --no-cache \
    aws-cli \
    bash \
    bash-completion \
    bind-tools \
    cargo \
    curl \
    gcc \
    git \
    helm \
    jq \
    kubectl \
    libffi-dev \
    make \
    musl-dev \
    netcat-openbsd \
    openssl-dev \
    py3-pip \
    py3-setuptools \
    python3-dev \
    util-linux \
    vim \
    && pip install --no-cache-dir --prefix=/usr azure-cli \
    && echo complete -C '/usr/bin/aws_completer' aws >> ~/.bashrc \
    && echo 'source <(kubectl completion bash)' >>~/.bashrc \
    && echo 'source <(helm completion bash)' >>~/.bashrc \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["bash"]
