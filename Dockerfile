# NAME ubuntu_rails_cicd_test
# VERSION: release
FROM ruby:2.5
ARG tag=build
EXPOSE 80
EXPOSE 443
EXPOSE 3000

MAINTAINER LukeClancy "lukeclancy@hotmail.com"
RUN apt-get update

RUN mkdir /etc/cicd_test
WORKDIR /etc/cicd_test
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server"]
