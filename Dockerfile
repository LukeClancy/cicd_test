# NAME ubuntu_rails_cicd_test
# VERSION: release
FROM ruby:2.5
ARG tag=build
EXPOSE 80
EXPOSE 443
EXPOSE 3000

#update and upgrade the host os
MAINTAINER LukeClancy "lukeclancy@hotmail.com"
RUN apt-get update
RUN apt-get upgrade -y

#install js runtime, add source repo
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs -y

#move to the home dir, move install files, install ruby install files
RUN mkdir /etc/cicd_test
WORKDIR /etc/cicd_test
COPY helloWorld/Gemfile helloWorld/Gemfile.lock ./
RUN bundle install

#copy rest of the stuff across
COPY . .

#change to the server main directory in preperation for 'rails server' command
WORKDIR /etc/cicd_test/helloWorld

CMD ["rails", "server"]
