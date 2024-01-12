# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Copy all files from the current directory to the working directory
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000


# Run npm start when the container launches
CMD ["npm", "start"]
