FROM runmymind/docker-android-sdk:ubuntu-lazydl
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

COPY package-list-minimal.txt /opt/tools/package-list-minimal.txt
RUN chmod a+r /opt/tools/package-list-minimal.txt

COPY home /root/
RUN chmod +x /root/sab-run-build.sh
RUN chmod +x /root/sab-build-debug-keystore.sh

WORKDIR /opt/android-sdk-linux
RUN /opt/tools/entrypoint.sh built-in
RUN apt update && apt install -y \
    libglib2.0-bin \
    curl \
    gnupg-agent \
    unzip \
    software-properties-common

WORKDIR /root
RUN curl -fsSL http://packages.sil.org/sil.gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] http://packages.sil.org/ubuntu bionic main" \
 && apt-get update \
 && wget https://packages.sil.org/ubuntu/pool/main/s/scripture-app-builder/scripture-app-builder_6.1%2Bubuntu1%2Bbionic1_amd64.deb \
 && apt install -y ./scripture-app-builder_6.1+ubuntu1+bionic1_amd64.deb \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/root/sab-run-build.sh" ]
