FROM debian:bookworm
LABEL maintainer="me@joshdouch.me" 
RUN  apt-get -y update && apt-get -y install ppp xl2tpd iproute2 tcpdump net-tools
RUN mkdir -p /var/run/xl2tpd/ && touch /var/run/xl2tpd/l2tp-control
COPY xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
COPY options /etc/ppp/options
CMD ["xl2tpd", "-D"]
