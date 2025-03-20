# Use the official Node.js image as the base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app for production
RUN npm run build

# Install 'serve' to serve the static files
RUN npm install -g serve

# Expose the port for the application
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "build", "-l", "3000"]
