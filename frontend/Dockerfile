# frontend/Dockerfile

FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose React port
EXPOSE 3000

# Start the React app
CMD ["npm", "start"]