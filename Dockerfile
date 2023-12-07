FROM ubuntu:latest

# Update distro
RUN apt update && apt dist-upgrade -y
# Install necessary package and clean up
RUN apt install -y apt-mirror wget gcc make perl nginx ca-certificates cron apt-transport-https lsb-release \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80:3143

VOLUME ["/var/spool/apt-mirror"]

# Set up the default mirror configuration
COPY mirror.list /etc/apt/mirror.list

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
