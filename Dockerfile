# Use Node.js 20 as the base image
FROM node:20 AS builder

# Set environment variables for production
ENV NODE_ENV=production

# Set working directory
WORKDIR /srv/app

# Copy package files first to leverage Docker layer caching
COPY package.json package-lock.json ./

# Install production dependencies
RUN npm install 

# Copy the rest of the application code
COPY . .

# Build the application (optional for Strapi if applicable)
# RUN npm run build

# Change ownership and permissions for non-root user
RUN chown -R node:node /srv/app

# Use Node.js official image for runtime (final stage for smaller image size)
FROM node:20-slim

# Set environment variables for production
ENV NODE_ENV=production

# Set working directory
WORKDIR /srv/app

# Copy files from the build stage
COPY --from=builder /srv/app /srv/app

# Use non-root user for better security
USER node

# Expose the Strapi port
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "start"]
