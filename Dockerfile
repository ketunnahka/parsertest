# 1. Start with a standard Node.js image (Alpine version)
#    This has a full working Linux OS, so 'apk' works out of the box!
FROM node:20-alpine

# 2. Install Python and the compilers (gcc/make) needed for your TF2 parser
RUN apk add --no-cache python3 py3-pip git build-base python3-dev

# 3. Install your custom TF2 parser
#    The '--break-system-packages' flag is required on newer Alpine versions
RUN pip install git+https://github.com/Square789/tf2_dem_py.git --break-system-packages

# 4. Install n8n manually
RUN npm install -g n8n

# 5. Set the User to 'node' (Security best practice)
USER node

# 6. Start n8n
CMD ["n8n"]
