FROM debian:latest
USER root
RUN mkdir -p /app
WORKDIR /app
#RUN wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.gnu.org/taler/taler-exchange-latest.tar.gz
#RUN wget http://mirror.netcologne.de/gnu/gnunet/gnunet-latest.tar.gz
#RUN tar -xvzf taler-exchange-latest.tar.gz && tar -xvzf gnunet-latest.tar.gz && rm gnunet-latest.tar.gz
#RUN cd gnunet-* &&  ./configure  --prefix=/usr/local --disable-documentation && make && make install
#RUN cd taler-exchange-* && ./configure && make && make install
RUN apt-get update && apt-get install wget postgresql-client sudo -y
RUN echo "deb [signed-by=/etc/apt/keyrings/taler-systems.gpg] https://deb.taler.net/apt/debian bookworm main" > /etc/apt/sources.list.d/taler.list
RUN wget -O /etc/apt/keyrings/taler-systems.gpg https://taler.net/taler-systems.gpg
RUN apt-get update && apt install -y taler-exchange taler-exchange-offline taler-wallet-cli
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
