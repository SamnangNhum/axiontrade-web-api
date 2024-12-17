# Use Node.js as the base image
FROM node:20

# Set working directory
WORKDIR /srv/app

# Copy package files for dependency installation
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the project files
COPY . .

# Change ownership and permissions for non-root user
RUN chown -R node:node /srv/app

# Use the non-root user for better security
USER node

# Expose Strapi port
EXPOSE 1337

# Start Strapi server
CMD ["npm", "start"]
