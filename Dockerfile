
FROM centos:7.7.1908

LABEL maintainer="shun0918"

ARG NVM_VERSION=0.38.0
ARG NODE_VERSION=16.2.0
ENV NVM_DIR /root/.nvm

RUN mkdir -p $NVM_DIR
# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
  && chmod +x $HOME/.nvm/nvm.sh \
  && source $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm use default

RUN ln -sf /root/.nvm/versions/node/v$NODE_VERSION/bin/node /usr/bin/nodejs
RUN ln -sf /root/.nvm/versions/node/v$NODE_VERSION/bin/node /usr/bin/node
RUN ln -sf /root/.nvm/versions/node/v$NODE_VERSION/bin/npm /usr/bin/npm

# EXPOSE 8800
CMD [ "node" ]