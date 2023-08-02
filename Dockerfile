FROM node:18.12.0-alpine3.15

ARG PLANTON_CLI_VERSION=v0.0.60

ARG YARN_VERSION=v3.2.3

RUN wget https://storage.googleapis.com/planton-cli/$PLANTON_CLI_VERSION/planton-cli-$PLANTON_CLI_VERSION-linux && \
    chmod +x planton-cli-$PLANTON_CLI_VERSION-linux && \
    mv planton-cli-$PLANTON_CLI_VERSION-linux planton && \
    cp planton /usr/local/bin && \
    corepack enable && \
    corepack prepare yarn@$YARN_VERSION --activate && \
#    https://stackoverflow.com/a/56175820/3427243
    yarn policies set-version $YARN_VERSION && \
    apk add bash make zip
COPY yarnrc.yml /root/.yarnrc.yml
