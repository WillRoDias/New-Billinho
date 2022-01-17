FROM ruby:3.0.0
  
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
WORKDIR /New_Billinho
COPY Gemfile /New_Billinho/Gemfile
COPY Gemfile.lock /New_Billinho/Gemfile.lock
RUN bundle install
RUN bundle update --bundler
CMD 'rails server -b 0.0.0.0'
  