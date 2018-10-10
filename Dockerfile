FROM elixir:1.6.6

# nodeのインストール
ENV NODE_VERSION 8.x
ENV NPM_VERSION 6.1.0

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash -
RUN apt-get install -y nodejs

RUN npm install npm@${NPM_VERSION} -g

# Elixirの依存関係のインストール
RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix local.rebar --force

WORKDIR /app