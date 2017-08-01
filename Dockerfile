FROM ruby:2.4.1

RUN gem install rails --version 5.1.2

COPY . /var/www/projeto

CMD cd /var/www/projeto && rails s
