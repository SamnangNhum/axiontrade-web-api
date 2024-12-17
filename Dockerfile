# Use Node.js official image as the base image
FROM node:20

# Set the working directory
WORKDIR /srv/app

# Copy package files first for dependency installation
COPY package.json package-lock.json ./

# Install dependencies (omit dev dependencies in production)
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the project files into the container
COPY . .

# Ensure correct permissions for the project directory
RUN chown -R node:node /srv/app

# Switch to a non-root user for better security
USER node

# Expose the default Strapi port
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "start"]
