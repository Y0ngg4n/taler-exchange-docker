FROM debian:latest
USER root
RUN mkdir -p /app
WORKDIR /app
RUN apt-get update && apt-get install wget postgresql-client sudo nginx build-essential -y
RUN apt-get install -y \
  jq \
  libqrencode-dev \
  libsqlite3-dev \
  libltdl-dev \
  libunistring-dev \
  libsodium-dev \
  libargon2-dev \
  libcurl4-gnutls-dev \
  libgcrypt20-dev \
  libjansson-dev \
  libpq-dev \
  libmicrohttpd-dev \
  python3-jinja2 zlib1g-dev \
  pkg-config \
  git
#RUN wget https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-latest.tar.gz && tar -xvzf libmicrohttpd-latest.tar.gz && cd libmicrohttpd* && ./configure && make && make install
RUN wget https://ftp.gnu.org/gnu/taler/taler-exchange-latest.tar.gz
RUN wget https://ftp.gnu.org/gnu/gnunet/gnunet-latest.tar.gz
RUN tar -xvzf taler-exchange-latest.tar.gz && tar -xvzf gnunet-latest.tar.gz && rm gnunet-latest.tar.gz && rm taler-exchange-latest.tar.gz 
RUN cd gnunet-* &&  ./configure && make && make install && ldconfig
RUN cd taler-exchange-* && ./configure && make && make install && ldconfig
#RUN echo "deb [signed-by=/etc/apt/keyrings/taler-systems.gpg] https://deb.taler.net/apt/debian bookworm main" > /etc/apt/sources.list.d/taler.list
#RUN wget -O /etc/apt/keyrings/taler-systems.gpg https://taler.net/taler-systems.gpg
#RUN apt-get update && apt install -y taler-exchange taler-exchange-offline taler-wallet-cli
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && ln -s /etc/nginx/sites-available/taler-exchange /etc/nginx/sites-enabled/taler-exchange
ENTRYPOINT /entrypoint.sh
