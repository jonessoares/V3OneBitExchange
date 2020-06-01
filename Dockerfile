FROM ruby:2.6.5

#nodejs e dependencias pacote
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Dependencias - instalaçao
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

#bundler
RUN gem install bundler

#path - seta o projeto
ENV INSTALL_PATH /onebitexchange

RUN mkdir -p $INSTALL_PATH

#Seta path como diretorio principal
WORKDIR $INSTALL_PATH

COPY Gemfile ./

#Path para gems
ENV BUNDLE_PATH /gems

#Copia para o container
COPY . .
