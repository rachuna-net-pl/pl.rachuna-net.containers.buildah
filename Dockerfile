FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive
ENV STORAGE_DRIVER=vfs
ENV BUILDAH_ISOLATION=chroot

COPY scripts/ /opt/scripts/

# Install system dependencies and ansible
RUN apt-get update && apt-get install -y \
        buildah \
        curl \
        fuse-overlayfs \
        gzip \
        slirp4netns \
        iproute2 \
        uidmap \
        iputils-ping \
        dnsutils \
        ca-certificates \
        git \
        curl \
        gnupg \
        sudo \
        software-properties-common \
        tar \
        yq \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/buildah-root \
    && mkdir -p /tmp/buildah-runroot \

    # Make scripts executable
    && chmod +x /opt/scripts/*.bash

ENTRYPOINT ["/opt/scripts/entrypoint.bash"]