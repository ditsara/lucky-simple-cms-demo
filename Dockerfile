FROM crystallang/crystal:0.27.2
LABEL MAINTAINER="Dan Itsara <dan@glazziq.com>"

ENV builddir=/build

# - Install Lucky prereqs
#   - Overmind
#   - Node and Yarn
#   - other libs
# - Install Lucky
# - Cleanup build
RUN mkdir -p $builddir && cd $builddir \
  && apt-get update -qq \
  # curl for downloads, tmux required for Overmind
  && apt-get install -y curl tmux \
  # Overmind
  && curl -L -O https://github.com/DarthSim/overmind/releases/download/v2.0.1/overmind-v2.0.1-linux-amd64.gz \
  && gunzip overmind-v2.0.1-linux-amd64.gz \
  && mv overmind-v2.0.1-linux-amd64 /usr/local/bin/overmind \
  && chmod +x /usr/local/bin/overmind \
  # Node and Yarn
  && curl -sL https://deb.nodesource.com/setup_9.x | bash -\
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list\
  && apt-get update -y \
  && apt-get install -y nodejs yarn=1.7.0-1 \
  # all other libs
    libc6-dev libevent-dev libpcre2-dev libpng-dev libssl-dev libyaml-dev zlib1g-dev postgresql postgresql-contrib \
  && git clone https://github.com/luckyframework/lucky_cli $builddir/lucky_cli \
  && cd $builddir/lucky_cli \
  && git checkout v0.13.2 \
  && shards install \
  && crystal build src/lucky.cr --release --no-debug \
  && mv lucky /usr/local/bin/lucky \
  && cd / && rm -rf $builddir

WORKDIR /app
