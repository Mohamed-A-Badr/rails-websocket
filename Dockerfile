# Use official Ruby 3.0.2 image
FROM ruby:3.0.2

# Set environment variables
ENV RAILS_ENV=development \
    BUNDLER_VERSION=2.2.33 \
    TZ=Africa/Cairo

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  build-essential \
  libpq-dev \
  libsqlite3-dev \
  sqlite3 \
  curl \
  && apt-get clean

# Set working directory
WORKDIR /app

# Copy Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v "$BUNDLER_VERSION"
RUN bundle install

# Copy application code
COPY . .

# Expose default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
