FROM ghost:5.129.1

# Install PostgreSQL client and pg npm package
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*
RUN npm install --production pg

# Copy our custom entrypoint script
COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

# Explicitly expose the Ghost port
EXPOSE 2368

# Set environment variables for port binding
ENV server__host="0.0.0.0"
ENV server__port="2368"

# Set the user to 'node' before running the entrypoint
USER node

# Marker for debugging Dockerfile usage
RUN echo "CUSTOM DOCKERFILE BEING USED" > /tmp/custom_dockerfile_marker

# THIS LINE IS FOR DEBUGGING ONLY - IT WILL CAUSE THE BUILD TO FAIL IF RENDER USES THIS DOCKERFILE
RUN exit 1

# Use our custom entrypoint script
ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]
