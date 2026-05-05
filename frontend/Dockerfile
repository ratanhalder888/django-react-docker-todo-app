# frontend/Dockerfile

FROM node:18.19.1-alpine AS build

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install --registry=https://registry.npmmirror.com

# Copy the rest of the app
COPY . .

# Set API URL for build time (CRA requires this)
ENV REACT_APP_API_URL=http://localhost:8000/api/

# Build the React app
RUN npm run build

# Install serve to serve static files
RUN npm install -g serve

# Expose React port
EXPOSE 3000

# Start the React app
CMD ["serve", "-s", "build", "-l", "3000"]