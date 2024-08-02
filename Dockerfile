FROM mcr.microsoft.com/azure-functions/node:4-node18

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY . /home/site/wwwroot
ENV ASYNC_API_SCHEMA_FILE=/home/site/wwwroot/consumeData/assets/asyncapi.yaml
RUN ls -al
RUN cd /home/site/wwwroot && \
    npm install && \
    npm run build

# # To enable ssh & remote debugging on app service change the base image to the one below
# # FROM mcr.microsoft.com/azure-functions/node:3.0-appservice
# FROM node:20-alpine3.19 as builder

# ENV AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# WORKDIR /usr/workspace

# COPY . ./
# COPY package*.json ./

# RUN npm ci && \
#     npm run build


# # multi stage build for better performance
# FROM mcr.microsoft.com/azure-functions/node:4-node20-slim

# ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
#     AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# WORKDIR /home/site/wwwroot

# COPY --from=builder /usr/workspace/node_modules/ ./node_modules
# COPY --from=builder /usr/workspace/dist/src ./

