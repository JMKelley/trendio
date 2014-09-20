FROM ubuntu:trusty

MAINTAINER Jonathan Kelley <jonathan.mark.kelley@gmail.com>

# Install Ruby
RUN apt-get -y update
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
RUN apt-get -y install wget
RUN wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
RUN tar -xvzf ruby-2.1.2.tar.gz
RUN cd ruby-2.1.2 && ./configure --prefix=/usr/local
RUN cd ruby-2.1.2 && make
RUN cd ruby-2.1.2 && make install

# Install application system dependencies
RUN apt-get update
RUN apt-get install -y libgtkmm-2.4 libsasl2-dev
RUN apt-get install -y mysql-client mysql-common curl libmysqlclient-dev
RUN apt-get install -y libnotify-dev imagemagick
RUN apt-get install -y libglib2.0-bin
RUN apt-get install -y git-core curl

# Remove Ruby download
RUN rm ruby-2.1.2.tar.gz

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup the working directory
WORKDIR /api

# Install Bundler
RUN gem install bundler

# Add the application to the container (cwd)
ADD ./ /api

# Expose port 2345 and set env variable
EXPOSE 2345
ENV PORT 2345

# Bundle install the applications gem dependencies
RUN bundle install

# Setup the entrypoint
ENTRYPOINT ["bundle", "exec", "foreman"]
