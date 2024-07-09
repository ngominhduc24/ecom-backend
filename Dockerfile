# Use the official Node.js 18 image as the base image
FROM node:18.17.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install dependencies
RUN yarn install

# Install @medusajs/medusa-cli globally
RUN yarn global add @medusajs/medusa-cli

# Copy the rest of the application code to the working directory
COPY . .

RUN yarn build

# Expose the port that your app runs on
EXPOSE 7001
EXPOSE 9000

# Start the application
CMD ["yarn", "start"]
