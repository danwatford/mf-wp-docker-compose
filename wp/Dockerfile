FROM wordpress:php7.4

RUN \
  apt-get update && \
  apt-get install -y  --no-install-recommends ssl-cert && \
  rm -r /var/lib/apt/lists/* && \
  a2enmod ssl && \
  a2dissite 000-default.conf && \
  a2ensite default-ssl.conf && \
	groupadd --gid 1000 wp && \
	useradd --no-log-init --uid 1000 --gid 1000 --groups ssl-cert wp

ENV APACHE_RUN_USER wp
ENV APACHE_RUN_GROUP wp