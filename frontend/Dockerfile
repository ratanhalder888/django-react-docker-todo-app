# frontend/Dockerfile

FROM node:18.19.1-alpine AS build

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the React app
RUN npm run build

# Install serve to serve static files
RUN npm install -g serve

# Expose React port
EXPOSE 3000

# Start the React app
CMD ["serve", "-s", "build", "-l", "3000"]