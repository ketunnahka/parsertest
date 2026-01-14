# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to root to install system tools
USER root

# 3. Install Python and compilation tools (Using Debian 'apt-get' instead of Alpine 'apk')
#    'build-essential' is the Debian equivalent of 'build-base'
RUN apt-get update && \
    apt-get install -y python3 python3-pip git build-essential python3-dev

# 4. Install the parser directly from GitHub
RUN pip install git+https://github.com/Square789/tf2_dem_py.git --break-system-packages

# 5. Switch back to the n8n user
USER node