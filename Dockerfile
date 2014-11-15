FROM debian:wheezy

MAINTAINER Ozzy Johnson <docker@ozzy.io>

ENV DEBIAN_FRONTEND noninteractive

ENV MININET_REPO https://github.com/mininet/mininet.git
ENV MININET_INSTALLER mininet/util/install.sh
ENV INSTALLER_FIX_1 's/sudo //g'
ENV INSTALLER_FIX_2 's/\(apt-get -y install\)/\1 --no-install-recommends --no-install-suggest/g'
ENV INSTALLER_SWITCHES -fbinptvwyx

WORKDIR /tmp

# Update and install minimal.
RUN \
    apt-get update \
        --quiet \
    && apt-get install \
        --yes \
        --no-install-recommends \
        --no-install-suggests \
    autoconf \
    automake \
    ca-certificates \
    git \
    libtool \
    net-tools \
    openssh-client \
    patch \
    vim \

# Clone and install.
    && git clone $MININET_REPO

RUN sed -i 's/sudo //g' $MININET_INSTALLER
RUN sed -i 's/~\//\//g' $MININET_INSTALLER
RUN sed -i 's/\(apt-get -y install\)/\1 --no-install-recommends --no-install-suggests/g' $MININET_INSTALLER  
RUN touch /.bashrc
RUN git config --global url.https://github.insteadOf git://github \
    && chmod +x $MININET_INSTALLER \
    && ./$MININET_INSTALLER -nfv \

# Clean up packages.
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Prepare to build.
WORKDIR /tmp

VOLUME ["/data"]

WORKDIR /data

EXPOSE 6633

# Default command.
CMD ["bash"]
