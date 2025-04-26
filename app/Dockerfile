# Use Node 18 base image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy everything into container
COPY . .

# Install dependencies
RUN npm install

# Run the app
CMD ["node", "index.js"]

# Expose port
EXPOSE 3000