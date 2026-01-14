# 1. Start with the official n8n image as the base
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to 'root' user to install system updates and tools
USER root

# 3. Install Python, Pip, and Git
#    'build-base' and 'python3-dev' are CRITICAL for compiling the C-code in that parser
RUN apk add --no-cache python3 py3-pip git build-base python3-dev

# 4. Install the TF2 parser directly from GitHub
#    This command downloads the code and compiles it automatically
RUN pip install git+https://github.com/Square789/tf2_dem_py.git --break-system-packages

# 5. Switch back to the 'node' user (standard for n8n security)
USER node