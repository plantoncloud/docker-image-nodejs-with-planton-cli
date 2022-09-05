FROM node:17.3.1-alpine3.15
# this needs to be replaced with file download from external file repo of planton artifact-store
ADD build/planton-linux /usr/local/bin/planton
