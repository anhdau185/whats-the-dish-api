FROM ruby:3.0.5-alpine

RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs

WORKDIR /app

COPY Gemfile* .

RUN bundle install --without development test

COPY . .

CMD ["rails", "server", "-e", "production", "-p", "5000"]
