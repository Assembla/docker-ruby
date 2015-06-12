FROM assembla/ubuntu
MAINTAINER Artiom Di <kron82@gmail.com>

RUN apt-get install -y curl libtool autoconf build-essential libreadline6 \
    libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev \
    libffi-dev libgdbm-dev git \
    libxslt-dev bison flex \
    && apt-get clean
RUN curl --progress http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz | tar xz
RUN cd ruby-2.2.* && \
    ./configure --prefix=/usr --with-out-ext=tk --disable-install-doc --enable-shared && \
    make && make install && \
    cd .. && rm -rf ruby-2.1*
RUN gem install bundler --no-ri --no-rdoc
