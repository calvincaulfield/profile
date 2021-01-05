FROM ruby:2.6.3

WORKDIR /usr/src/app
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install -y nodejs
RUN apt install yarn

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN chmod u+x ./start_docker.sh

CMD ./start_docker.sh