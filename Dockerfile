FROM assembla/ubuntu
MAINTAINER Artiom Di <kron82@gmail.com>

RUN apt-get install -y libtool autoconf build-essential libreadline6 \
    libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev \
    libffi-dev libgdbm-dev \
    libxslt-dev bison flex \
    && apt-get clean
RUN curl http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz | \
    tar xvzf - -C /tmp && \
    cd /tmp/ruby-* && \
    ./configure --prefix=/usr --with-out-ext=tk --disable-install-doc && \
    make && make install && \
    cd .. && rm -rf ruby-*
RUN gem install bundler --no-ri --no-rdoc
