FROM ruby:2.4.1

RUN gem install rails --version 5.1.2

RUN apt-get update

RUN apt-get install -y nodejs

WORKDIR /var/www/projeto

COPY . /var/www/projeto

RUN bundle install

CMD rails s
