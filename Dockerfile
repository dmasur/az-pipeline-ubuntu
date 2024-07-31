FROM amd64/ubuntu:24.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    wget \
    openjdk-8-jdk \
    openjdk-11-jdk \
    openjdk-17-jdk \
    npm

# Install donet SDK
RUN apt-get update && \
  apt-get install -y dotnet-sdk-7.0 && \
  apt-get install -y dotnet-sdk-6.0

# TODO: Workaround for devops agent not supporting OpenSSL 3.0
# https://github.com/microsoft/azure-pipelines-agent/issues/3834#issuecomment-1160576447
RUN curl -sL http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb > libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
    rm libssl1.1_1.1.0g-2ubuntu4_amd64.deb

# https://github.com/microsoft/azure-pipelines-agent/issues/3834#issuecomment-1151874312
RUN sed -i 's/openssl_conf = openssl_init/#openssl_conf = openssl_init/g' /etc/ssl/openssl.cnf

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64

# Set JAVA_Home_Variables
ENV JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME_11_X64=/usr/lib/jvm/java-11-openjdk-amd64
ENV JAVA_HOME_17_X64=/usr/lib/jvm/java-17-openjdk-amd64

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]
