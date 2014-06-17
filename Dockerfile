FROM debian:wheezy
MAINTAINER Artiom Di <kron82@gmail.com>

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get \
    -o Dpkg::Options::="--force-confnew" \
    --force-yes \
    -fuy dist-upgrade
RUN apt-get install -y curl autoconf build-essential libreadline6 \
    libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev \
    libffi-dev libgdbm-dev && apt-get clean
RUN curl --progress http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz | tar xz
RUN cd ruby-2.1.2 && \
    ./configure --prefix=/usr --with-out-ext=tk --disable-install-doc && \
    make && make install && \
    cd .. && rm -rf ruby-2.1.2*
