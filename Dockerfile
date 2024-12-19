# Use Node.js as the base image
FROM node:20-alpine

# Set working directory
WORKDIR /srv/app

# Copy package.json and package-lock.json for dependency installation
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --legacy-peer-deps --omit=dev

# Copy the rest of the application files
COPY . .

# Build the admin panel
RUN npm run build

# Ensure proper permissions
RUN chown -R node:node /srv/app && chmod -R 775 /srv/app

# Switch to a non-root user for better security
USER node

# Set the environment to production
ENV NODE_ENV=production

# Expose the application port
EXPOSE 1337

# Start the application
CMD ["npm", "start"]
