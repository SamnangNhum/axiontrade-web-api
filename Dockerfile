# Use Node.js official image as the base image
FROM node:20

# Set the working directory
WORKDIR /srv/app

# Copy only package files first for dependency installation
COPY package.json package-lock.json ./

# Install dependencies without running scripts to speed up builds
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the project files
COPY . .

# Expose Strapi port
EXPOSE 1337

# Start Strapi server directly
CMD ["npm", "start"]
