FROM ubuntu:16.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install prerequisites
RUN apt-get update && apt-get install -y \
  ruby \
  ruby-dev \
  libpng-dev \
  git \
  make \
  gcc \
  curl

RUN gem install --no-ri --no-rdoc \
  jekyll \
  rouge \
  bundler \
  kramdown

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.10.3

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g bower grunt-cli npm-shrinkwrap

# possible volume mount point for convenient use
RUN mkdir -p /opt/jekyll
WORKDIR /opt/jekyll

# Build:
# docker build -t wetransform/jekyll .

# Push:
# docker push wetransform/jekyll
