FROM ruby:3.1.4 AS base

COPY Gemfile Gemfile.lock ./
COPY main.rb ./
COPY /src/ ./src/
COPY /spec/ ./spec/
COPY /coverage/ ./coverage/

RUN ["bundle", "install"]