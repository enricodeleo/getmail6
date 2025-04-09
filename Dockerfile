FROM python:3-slim

# Install getmail6
RUN pip install --no-cache-dir getmail6

# Set working directory
WORKDIR /config
