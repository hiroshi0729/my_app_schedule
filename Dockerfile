FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq \
  && apt-get install -y ca-certificates curl gnupg \
  && mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
  && apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs \
  && npm install -g yarn@1.22.22
RUN mkdir /my_app_schedule
WORKDIR /my_app_schedule
RUN gem install bundler:2.3.17
COPY Gemfile /my_app_schedule/Gemfile
COPY Gemfile.lock /my_app_schedule/Gemfile.lock
RUN bundle install
COPY . /my_app_schedule