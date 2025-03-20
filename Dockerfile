# Base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the entire app directory to the container
COPY . .

# Build the React app
RUN npm run build

# Install `serve` globally to serve the built app
RUN npm install -g serve

# Set environment to production
ENV NODE_ENV=production

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["serve", "-s", "build"]
