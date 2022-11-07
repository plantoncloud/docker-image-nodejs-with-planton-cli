FROM node:17.3.1-alpine3.15

ARG PLANTON_CLI_VERSION=v0.0.13

ARG YARN_VERSION=v3.2.3

RUN wget https://storage.googleapis.com/planton-pcs-artifact-file-repo/tool/cli/download/planton-cli-$PLANTON_CLI_VERSION-linux && \
    chmod +x planton-cli-$PLANTON_CLI_VERSION-linux && \
    mv planton-cli-$PLANTON_CLI_VERSION-linux planton && \
    cp planton /usr/local/bin && \
    corepack enable && \
    corepack prepare yarn@$YARN_VERSION --activate
COPY yarnrc.yml /root/.yarnrc.yml
