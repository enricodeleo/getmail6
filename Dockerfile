FROM python:3-alpine

# Create non-root user and group
RUN addgroup -g 1000 getmail && adduser -u 1000 -G getmail -D getmail

# Install getmail6
RUN pip install --no-cache-dir getmail6

# Use non-root user
USER getmail

# Working directory for config
WORKDIR /config

# No entrypoint, we pass commands via compose
