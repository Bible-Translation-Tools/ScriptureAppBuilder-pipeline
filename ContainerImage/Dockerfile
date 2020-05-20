FROM runmymind/docker-android-sdk:ubuntu-lazydl
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
COPY package-list-minimal.txt /opt/tools/package-list-minimal.txt
COPY home /root/
WORKDIR /opt/android-sdk-linux
RUN /opt/tools/entrypoint.sh built-in
RUN apt-get update && apt-get install -y \
    curl \
    gnupg-agent \
    unzip \
    software-properties-common && \
    curl -fsSL http://packages.sil.org/sil.gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] http://packages.sil.org/ubuntu bionic main" && \
    apt-get update && \
    apt-get install -y scripture-app-builder && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /root
ENTRYPOINT [ "/root/sab-run-build.sh" ]
