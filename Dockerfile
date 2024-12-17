# Use Node.js official image as the base image
FROM node:20

# Set the working directory
WORKDIR /srv/app

# Copy package files for dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Strapi app (if needed)
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start Strapi server
CMD ["npm", "start"]
