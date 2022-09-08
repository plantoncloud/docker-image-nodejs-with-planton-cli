FROM node:17.3.1-alpine3.15
RUN corepack enable && \
    corepack prepare yarn@v3.2.3 --activate
COPY yarnrc.yml /root/.yarnrc.yml
# this needs to be replaced with file download from external file repo of planton artifact-store
ADD build/planton-linux /usr/local/bin/planton
