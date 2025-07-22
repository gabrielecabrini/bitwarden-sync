FROM alpine:latest

WORKDIR /app

# Install only the necessary packages
RUN apk --no-cache add \
    bash \
    openssl \
    tar \
    jq \
    findutils \
    coreutils \
    util-linux \
    nodejs \
    npm

# Suppress Node.js deprecation warnings
ENV NODE_OPTIONS="--no-deprecation"

# Install Bitwarden CLI
RUN npm install -g @bitwarden/cli

# Set default cron schedule (override with env if needed)
ENV CRON_SCHEDULE="57 23 * * *"

# Copy and prepare the sync script
COPY bitwarden_sync.sh /app/script.sh
RUN chmod +x /app/script.sh

# Setup cron job
RUN echo "$CRON_SCHEDULE /app/script.sh > /proc/1/fd/1 2>&1" > /etc/crontabs/root

# Run cron in foreground and log to stdout
CMD ["crond", "-f", "-L", "/dev/stdout"]
