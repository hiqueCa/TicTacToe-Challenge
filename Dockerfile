FROM ruby:3.1.4

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["ruby", "main.rb"]