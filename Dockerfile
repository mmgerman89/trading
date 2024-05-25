FROM ruby:3.3.0

LABEL maintainer="Germán Martínez"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -qq -y --fix-missing --no-install-recommends \
	build-essential \
    libpq-dev \
	yarn \
    postgresql-client

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
    apt-get install -y nodejs


# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /usr/src/app/
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* $INSTALL_PATH/
# COPY Procfile $INSTALL_PATH/

# Set bundler environment variables as the directory to install the gems
ENV BUNDLE_GEMFILE $INSTALL_PATH/Gemfile
ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH /gems

RUN gem update --system \
  && gem install bundler -v 2.5.6 \
  && gem install rails -v 7.1.3 \
  && gem install sidekiq \
  && gem install puma \
  && bundle install

RUN yarn install --check-files

ADD . $INSTALL_PATH

ENTRYPOINT ["./docker-entrypoint.sh"]

# CMD ["bin/rails", "s", "-b", "0.0.0.0"]
