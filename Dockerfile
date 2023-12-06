FROM ubuntu:latest

# Update distro
RUN apt update && apt dist-upgrade -y
# Install necessary package and clean up
RUN apt install -y apt-mirror wget gcc make perl nginx ca-certificates cron apt-transport-https lsb-release \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80 

VOLUME ["/var/spool/apt-mirror"]

ENTRYPOINT ["/var/spool/apt-mirror/entrypoint.sh"]
