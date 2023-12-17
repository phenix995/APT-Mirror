FROM ubuntu:latest

# Create a non-root user
RUN useradd -m -d /home/aptmirror aptmirror

# Install necessary packages in a single layer and clean up
RUN apt update && \
    apt install -y apt-mirror wget gcc make perl nginx ca-certificates cron apt-transport-https lsb-release && \
    rm -rf /var/lib/apt/lists/*

# Copy the necessary files
COPY mirror.list /etc/apt/mirror.list
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the user
USER aptmirror

# Set the volume
VOLUME ["/var/spool/apt-mirror"]

# Expose the port
EXPOSE 3143

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3143 || exit 1

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
