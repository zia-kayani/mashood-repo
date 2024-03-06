# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install all dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the TypeScript files
RUN npm run build

# Environment Variable to check for the program environment
ENV NODE_ENV=production

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application based on the NODE_ENV
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"development\" ]; then npm run start:dev; else npm run start:prod; fi"]
