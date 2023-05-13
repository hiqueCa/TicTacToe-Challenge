FROM ruby:3.1.4 AS base

COPY Gemfile Gemfile.lock ./
COPY requirements_helper.rb requirements_helper.rb
COPY main.rb main.rb
COPY ./src/ ./src/
COPY ./spec/ ./spec/

RUN ln -s -f /proc/1/fd/1  /dev/stdout

RUN ["bundle", "install"]

CMD [ "ruby", "main.rb" ]