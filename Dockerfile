# 1. THE DONOR: Start with a standard Alpine image to get the tools we need
FROM alpine:3.20 AS donor

# 2. THE PATIENT: Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

USER root

# 3. THE TRANSPLANT: Copy the package manager (apk) from the donor to n8n
#    We must restore the binary and its configuration files
COPY --from=donor /sbin/apk /sbin/apk
COPY --from=donor /lib/apk /lib/apk
COPY --from=donor /etc/apk /etc/apk
COPY --from=donor /usr/share/apk /usr/share/apk
COPY --from=donor /var/lib/apk /var/lib/apk

# 4. INSTALL: Now 'apk' works again! Install Python & Build Tools
RUN apk update && \
    apk add --no-cache python3 py3-pip git build-base python3-dev

# 5. PARSER: Install your TF2 tool
RUN pip install git+https://github.com/Square789/tf2_dem_py.git --break-system-packages

# 6. FINISH: Secure the container
USER node
