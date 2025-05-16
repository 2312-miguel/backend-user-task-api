FROM ruby:3.2-alpine

RUN apk add --no-cache yaml-dev build-base nodejs postgresql-client postgresql-dev git

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
