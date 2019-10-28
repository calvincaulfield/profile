FROM ruby:2.5

WORKDIR /usr/src/app
RUN apt update
RUN apt install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install yarn

COPY Gemfile ./
RUN bundle install

COPY . .