FROM ubuntu:22.04

RUN apt-get clean && apt-get update

# Copy and all target programs.
WORKDIR /root/rosarum/
COPY targets/ .
# Install target program dependencies.
RUN apt-get update && apt-get install -y autoconf autogen automake bison build-essential cmake \
    libasound2-dev libboost-all-dev libbrotli-dev libbz2-dev libcap-dev libdeflate-dev \
    libflac-dev libharfbuzz-dev libjbig-dev libjpeg-dev liblerc-dev liblcms2-dev liblzma-dev \
    libmp3lame-dev libmpg123-dev libogg-dev libopenjp2-7-dev libopus-dev libpam-dev \
    libsqlite3-dev libssl-dev libtiff-dev libtool libvorbis-dev libwebp-dev libxml2-dev \
    libzstd-dev netcat-traditional pkg-config re2c zip
# Install tclsh, needed by the SQLite3 benchmark.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tclsh

# Needed by proftpd-1.3.3c
RUN ln -s /bin/sh /sbin/sh

# Needed by cyrus-imapd-3.12.1
RUN apt install -y libical-dev

# Build all target programs with all 3 variants (safe, backdoored, ground-truth).
RUN make all
