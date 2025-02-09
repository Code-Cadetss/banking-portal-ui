# Use official Node image as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port 3001
EXPOSE 3001

# Start the application using ng serve
CMD ["npm", "start", "--", "--host", "0.0.0.0", "--port", "3001", "--disable-host-check"]
