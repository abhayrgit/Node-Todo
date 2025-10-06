# Use a lightweight Node.js base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Use faster npm registry (optional)
RUN npm config set registry https://registry.npmmirror.com

# Copy only package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

# Expose the port from .env or default
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]