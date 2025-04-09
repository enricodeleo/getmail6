FROM python:3-alpine

# Install getmail6
RUN pip install --no-cache-dir getmail6

# Working directory for configuration
WORKDIR /config

# No default entrypoint, will run commands from compose
