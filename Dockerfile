FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /workdir
WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock


ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler:2.0.2
RUN bundle install

ADD . /workdir

