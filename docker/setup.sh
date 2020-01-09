apt update -yq
apt install -yq  g++ \
  wget tree \
  git \
  cmake \
  bison \
  flex \
  automake \
  autoconf \
  autoconf-archive \
  pkg-config \
  libtool \
  libboost-all-dev \
  libevent-dev && apt clean
apt install -yq \
  libdouble-conversion-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  liblz4-dev \
  liblzma-dev \
  libsnappy-dev \
  make \
  zlib1g-dev \
  binutils-dev \
  libjemalloc-dev \
  libssl-dev \
  libiberty-dev \
  libzstd-dev \
  libkrb5-dev \
  libsodium-dev && apt clean

# get folly version from script argument or use a default version
VERS=${1:-v2020.01.06.00}

git clone --branch ${VERS} https://github.com/facebook/folly.git

ls -l /external/src

function setup_fmt() {
    git clone --branch 6.1.2 https://github.com/fmtlib/fmt.git && \
        mkdir fmt_build && cd fmt_build && \
        cmake ../fmt && \
        make -j$(nproc) install && \
        cd /external/src && rm -rf fmt_build
}

setup_fmt

cd /external/src

mkdir folly_build && cd folly_build && \
    cmake -DCMAKE_INSTALL_PREFIX=/external -DBUILD_TESTS=off ../folly && \
    make -j $(nproc) all install && \
    cd /external/src && rm -rf folly_build
