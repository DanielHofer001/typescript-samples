FROM node:20-alpine3.19 AS builder

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

WORKDIR /home/site/wwwroot

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

RUN npm install

# Copy the rest of the source files
COPY . .

# Run the build process
RUN npm run build


# Multi-stage build for better performance
FROM mcr.microsoft.com/azure-functions/node:4-node20-slim

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

WORKDIR /home/site/wwwroot

# Copy the necessary files and directories from the builder stage
COPY --from=builder /home/site/wwwroot/node_modules ./node_modules
COPY --from=builder /home/site/wwwroot/dist ./dist
COPY --from=builder /home/site/wwwroot/package.json ./
COPY --from=builder /home/site/wwwroot/host.json ./
