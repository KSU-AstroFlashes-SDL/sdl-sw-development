ARG UBUNTU_TAG=26.04
FROM ubuntu:${UBUNTU_TAG}
LABEL org.opencontainers.image.authors="Matthew Zipay <mzipay@kent.edu>"

# Ubuntu packages that are needed ONLY during image build.
# These packages are never included in an image layer.
ARG BUILD_PACKAGE_LIST

# Ubuntu packages that are needed by the image at runtime.
# This list includes ALL packages needed by F-prime and Buildroot.
# These packages remain in the built image.
ARG RUN_PACKAGE_LIST="\
	7zip \
	bash \
	bash-completion \
	bc \
	binutils \
	build-essential \
	bzip2 \
	ca-certificates \
	clang \
	clang-format \
	clang-tidy \
	cmake \
	cpio \
	curl \
	diffutils \
	file \
	findutils \
	gawk \
	gdb \
	git \
	graphviz \
	gzip \
	libbz2-dev \
	libffi-dev \
	liblzma-dev \
	libncurses-dev \
	libreadline-dev \
	libsqlite3-dev \
	libssl-dev \
	libxml2-dev \
	libxmlsec1-dev \
	lldb \
	locales \
	nano \
	neovim \
	openssh-client \
	patch \
	perl \
	pipx \
	python-is-python3 \
	python3 \
	python3-pip \
	python3-venv \
	rsync \
	sed \
	tar \
	tk-dev \
	unzip \
	valgrind \
	wget \
	xz-utils \
	zlib1g-dev \
"

USER root

COPY lifecycle/ /opt/lifecycle/
COPY skeleton/ /home/developer/

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update --yes && \
	apt-get install -y --no-install-recommends ${BUILD_PACKAGE_LIST} ${RUN_PACKAGE_LIST} && \
	sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
	locale-gen && \
	update-locale LANG=en_US.UTF-8 && \
	curl -sSfL https://get.anchore.io/syft | sh -s -- -b /usr/local/bin && \
	curl -sSfL https://get.anchore.io/grype | sh -s -- -b /usr/local/bin && \
	userdel --force --remove ubuntu 2>/dev/null || true && \
	groupdel --force ubuntu 2>/dev/null || true && \
	groupadd --gid 1000 sdlsw && \
	useradd --uid 1000 --gid sdlsw --shell /bin/bash --create-home developer && \
	rm -f /home/developer/.bash_profile /home/developer/.bashrc /home/developer/.profile && \
	mv /home/developer/_bashrc /home/developer/.bashrc && \
	mv /home/developer/_profile /home/developer/.profile && \
	mkdir -p /home/developer/.local/bin && \
	apt-get purge --auto-remove -y ${BUILD_PACKAGE_LIST} && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	chgrp -R sdlsw /opt/lifecycle && \
	chmod -R g+x /opt/lifecycle && \
	chown -R developer:sdlsw /home/developer && \
	chmod -R u=rwX,go=rX /home/developer

USER developer

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

WORKDIR /home/developer

