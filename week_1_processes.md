🚀 **Project Title:** Auto-Deploy a Web App to AWS using GitHub Actions, Docker, and Terraform

🎯 **Goal:**
A simple Node.js app (or static HTML) will:

- Be containerized with Docker
- Infrastructure (EC2 + security group) provisioned via Terraform
- Auto-deployed to EC2 via GitHub Actions (CI/CD)

🔧 **Tools You’ll Use:**

| Tool           | Purpose                |
| -------------- | ---------------------- |
| Docker         | Containerize your app  |
| GitHub Actions | CI/CD pipeline         |
| Terraform      | Provision EC2 on AWS   |
| AWS EC2        | Host your container    |
| Linux CLI      | Deploy & manage server |

📦 **What You’ll Build:**

- `/app`: a simple web app
- `/Dockerfile`: container setup
- `/terraform`: your infra as code
- `.github/workflows/deploy.yml`: your automation pipeline

🗓️ **7-Day Plan (You Can Do This Faster!)**

✅ **Day 1: Basic Setup**

- Create GitHub repo
- Write a basic Node.js or static HTML app (`index.js` or `index.html`)
- Test it locally

**Resources:**

- Simple Node app: [https://github.com/heroku/node-js-sample](https://github.com/heroku/node-js-sample)
- Or use just HTML: `index.html`
####################################################################################
# 🚀 Learn Node.js from Scratch — Beginner's Guide (Day 1)

---

## 📌 What is Node.js?

**Node.js** is:
- A **JavaScript runtime environment** (meaning you can run JS outside the browser).
- Built on **Chrome’s V8 engine**.
- Used to build **servers**, **APIs**, and **backend logic**.
- Great for building fast and scalable applications.

### ✅ Why Use Node.js?
- It uses **JavaScript** (same as frontend) — learn once, use everywhere.
- It is **non-blocking** and handles many users at once.
- Very popular in cloud and DevOps projects.

---

## 💡 Simple Example (Print Hello)

```js
// hello.js
console.log("Hello from Node.js!");
```

🔧 To run it:

```bash
node hello.js
```

You will see:

```
Hello from Node.js!
```

✅ That’s Node.js running your JavaScript outside the browser.

---

## 💠 Build a Simple Node.js Web Server

Now let’s create a real **web server** with Node.js.

### 🏗 Project Structure

```
app/
├── index.js          # Main server file
├── package.json      # Project info (auto-created)
```

---

## 📁 Step 1: Create the Folder

```bash
mkdir app && cd app
```

---

## 📄 Step 2: Create `index.js` and Add This Code:

```js
// 1. Load built-in HTTP module to create a web server
const http = require('http');

// 2. Create the server
const server = http.createServer((req, res) => {
  // Set the status code to 200 (OK)
  res.statusCode = 200;

  // Set the content type to plain text
  res.setHeader('Content-Type', 'text/plain');

  // Send the response to the browser
  res.end('🚀 Hello, World! This is my Node.js app on AWS!\n');
});

// 3. Choose port (from environment or default to 3000)
const PORT = process.env.PORT || 3000;

// 4. Start the server and listen on the chosen port
server.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});
```

---

## 📦 Step 3: Initialize Your Project

```bash
npm init -y
```

This creates a file called `package.json`, which keeps project info.

You’ll see this inside:

```json
{
  "name": "node-app",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  }
}
```

---

## 🚀 Step 4: Run the Server

Start the server using:

```bash
node index.js
```

Now open your browser and go to:

```
http://localhost:3000
```

You’ll see this message:

```
🚀 Hello, World! This is my Node.js app on AWS!
```

🎉 Congratulations! You just built your first Node.js web server.

---

## 📝 Summary

| Step       | Description                          |
|------------|--------------------------------------|
| `require()`| Load a built-in module (HTTP)        |
| `createServer()` | Creates the server             |
| `res.end()`| Sends the response to browser        |
| `listen()` | Starts the server and opens a port   |
| `npm init` | Creates your project info            |

---
###################################################################################

✅ **Day 2: Dockerize Your App**

- Write `Dockerfile`
- Build + run container locally

```Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]
EXPOSE 3000
```

**Commands:**

```bash
docker build -t myapp .
docker run -p 3000:3000 myapp
```

####################################################################################
## ✅ Day 2: Dockerize Your App

### 🧱 What is Docker?
Docker lets you package your app and everything it needs into one container — which runs the same anywhere (your PC, cloud, etc).

---

## 📄 Step 1: Create a `Dockerfile`

Inside your `app/` folder, create a new file called `Dockerfile` and add:

```Dockerfile
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
```

### 🧠 Explanation:
- `FROM node:18`: Use official Node.js base image.
- `WORKDIR /app`: All commands run inside /app.
- `COPY . .`: Copy your app into container.
- `RUN npm install`: Install packages.
- `CMD`: What to run when container starts.
- `EXPOSE`: Let Docker know this app runs on port 3000.

---

## 🔨 Step 2: Build Your Docker Image

Inside the app folder, run:

```bash
docker build -t myapp .
```

This builds a Docker image called `myapp` using the Dockerfile.

---

## ▶️ Step 3: Run the Docker Container

Now run the app in Docker:

```bash
docker run -p 3000:3000 myapp
```

Open your browser:

```
http://localhost:3000
```

✅ You will see the same “Hello World” message, but now it's running **inside Docker**!

---

✅ Well done! You've Dockerized your Node.js app.

**Next** → Day 3: Provision AWS EC2 using Terraform 💻


####################################################################################


✅ **Day 3–4: Terraform – Create EC2 on AWS**

- Learn: Terraform basics (`main.tf`, `provider.tf`, `variables.tf`)
- Create EC2 instance with `user_data` to install Docker

**Snippet:**

```hcl
resource "aws_instance" "app" {
  ami           = "ami-1234567890"  # Choose Ubuntu AMI
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              EOF
}
```
###################################################################################
###########################################################################
✅ **Day 5: GitHub Actions – Auto Deploy**

- Create `.github/workflows/deploy.yml`
- It connects to your EC2 and pulls + runs your Docker container

**Snippet:**

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: SSH and deploy
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ubuntu
          key: ${{ secrets.EC2_SSH_KEY }}
          script: |
            docker stop myapp || true
            docker rm myapp || true
            docker pull yourdockerhub/myapp
            docker run -d -p 80:3000 --name myapp yourdockerhub/myapp
```

✅ **Day 6: Push to DockerHub**

- Create DockerHub account
- Tag and push your container:

```bash
docker tag myapp yourdockerhub/myapp
docker push yourdockerhub/myapp
```

✅ **Day 7: Final Polish**

- Write `README.md`
- Record screen + upload demo on GitHub
- Post about it on LinkedIn
- Add to resume

can
############################################################################################################################################################################################################################################################
It seems you're encountering an issue when trying to copy the entire content and paste it all at once. I understand you'd like a clean format where everything is easy to copy. Here's how you can solve this:

### Steps:

1. **Create a Text File**: Open your favorite text editor (e.g., Notepad, Visual Studio Code, Sublime Text).

2. **Copy the Content**: Copy the full content from the following block and paste it into the text editor. This should preserve the structure.

````markdown
# Auto-Deploy a Web App to AWS using GitHub Actions, Docker, and Terraform

---

### ✅ **Day 1: Basic Setup**

#### **Create GitHub Repo**
1. Go to GitHub and create a new repository.
2. Initialize it with a README file.

#### **Write a Basic Node.js or Static HTML App**

1. If you are using Node.js, create a new file called `index.js` with the following simple app:

```js
const http = require('http');

const server = http.createServer((req, res) => {
  res.write('Hello World');
  res.end();
});

server.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
````

2. If you are using static HTML, create an `index.html` file with basic content:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Web App</title>
</head>
<body>
  <h1>Hello World</h1>
</body>
</html>
```

***

### ✅ **Day 2: Dockerize Your App**

#### **Write Dockerfile**

To containerize your app, you'll create a `Dockerfile`. Here’s an example of a Dockerfile for the Node.js app:

```Dockerfile
# Use the official Node.js image from Docker Hub
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy all the files from your local directory into the container
COPY . .

# Install the dependencies
RUN npm install

# Expose the port the app will run on
EXPOSE 3000

# Command to run your app
CMD ["node", "index.js"]
```

#### **Build and Run Container Locally**

To build and run the Docker container locally, use these commands:

```bash
# Build the Docker image
docker build -t myapp .

# Run the Docker container
docker run -p 3000:3000 myapp
```

***

### ✅ **Day 3-4: Terraform – Create EC2 on AWS**

#### **Introduction to Terraform**

Terraform is an Infrastructure-as-Code tool that allows you to define and provision cloud infrastructure with configuration files.

##### **Terraform Code Example**:

```hcl
# provider.tf - Configure the AWS provider
provider "aws" {
  region = "us-west-2"  # Specify your AWS region
}

# main.tf - EC2 instance definition
resource "aws_instance" "app" {
  ami           = "ami-1234567890"  # Use an Ubuntu AMI (or the appropriate one for your region)
  instance_type = "t2.micro"        # Choose an appropriate EC2 instance type

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              EOF
}

# variables.tf - Define variables (optional but useful for scalability)
variable "ami" {
  default = "ami-1234567890"  # Example AMI ID, change for your region
}
```

#### **Terraform Commands**

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration (creates the EC2 instance)
terraform apply
```

***

### ✅ **Day 5: GitHub Actions – Auto Deploy**

#### **Create GitHub Actions Workflow**

Create a `.github/workflows/deploy.yml` file with the following content to deploy your app to EC2 automatically when changes are pushed to GitHub:

```yaml
name: Deploy Node.js App to AWS EC2

on:
  push:
    branches:
      - main  # Trigger deployment on push to the main branch

jobs:
  deploy:
    runs-on: ubuntu-latest  # Use the latest Ubuntu runner

    steps:
      - name: Checkout code
        uses: actions/checkout@v2  # Checkout the repository code

      - name: SSH and deploy
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ubuntu
          key: ${{ secrets.EC2_SSH_KEY }}
          script: |
            docker stop myapp || true
            docker rm myapp || true
            docker pull yourdockerhub/myapp
            docker run -d -p 80:3000 --name myapp yourdockerhub/myapp
```

***

### ✅ **Day 6: Push to DockerHub**

#### **Create DockerHub Account**

1. Sign up on DockerHub at <https://hub.docker.com/>.

2. After logging in, tag and push your Docker container:

```bash
docker tag myapp yourdockerhub/myapp
docker push yourdockerhub/myapp
```

***

### ✅ **Day 7: Final Polish**

1. **Write `README.md`** to explain how to use the app, Docker, Terraform, and the GitHub Actions setup.

2. **Record a demo video** of your app in action and upload it to GitHub or another platform.

3. **Post about your project** on LinkedIn to showcase your work.

4. **Add the project to your resume**.

***

**End of Project**: You have successfully set up a fully automated, containerized web application that deploys to AWS EC2 using Docker, Terraform, and GitHub Actions!

```
- [ ] ![](It seems you're encountering an issue when trying to copy the entire content and paste it all at once. I understand you'd like a clean format where everything is easy to copy. Here's how you can solve this:

### Steps:
1. **Create a Text File**: Open your favorite text editor (e.g., Notepad, Visual Studio Code, Sublime Text).
2. **Copy the Content**: Copy the full content from the following block and paste it into the text editor. This should preserve the structure.

```markdown
# Auto-Deploy a Web App to AWS using GitHub Actions, Docker, and Terraform

---

### ✅ **Day 1: Basic Setup**

#### **Create GitHub Repo**
1. Go to GitHub and create a new repository.
2. Initialize it with a README file.

#### **Write a Basic Node.js or Static HTML App**

1. If you are using Node.js, create a new file called `index.js` with the following simple app:

```js
const http = require('http');

const server = http.createServer((req, res) => {
  res.write('Hello World');
  res.end();
});

server.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
```

2. If you are using static HTML, create an `index.html` file with basic content:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Web App</title>
</head>
<body>
  <h1>Hello World</h1>
</body>
</html>
```

---

### ✅ **Day 2: Dockerize Your App**

#### **Write Dockerfile**

To containerize your app, you'll create a `Dockerfile`. Here’s an example of a Dockerfile for the Node.js app:

```Dockerfile
# Use the official Node.js image from Docker Hub
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy all the files from your local directory into the container
COPY . .

# Install the dependencies
RUN npm install

# Expose the port the app will run on
EXPOSE 3000

# Command to run your app
CMD ["node", "index.js"]
```

#### **Build and Run Container Locally**

To build and run the Docker container locally, use these commands:

```bash
# Build the Docker image
docker build -t myapp .

# Run the Docker container
docker run -p 3000:3000 myapp
```

---

### ✅ **Day 3-4: Terraform – Create EC2 on AWS**

#### **Introduction to Terraform**

Terraform is an Infrastructure-as-Code tool that allows you to define and provision cloud infrastructure with configuration files.

##### **Terraform Code Example**:

```hcl
# provider.tf - Configure the AWS provider
provider "aws" {
  region = "us-west-2"  # Specify your AWS region
}

# main.tf - EC2 instance definition
resource "aws_instance" "app" {
  ami           = "ami-1234567890"  # Use an Ubuntu AMI (or the appropriate one for your region)
  instance_type = "t2.micro"        # Choose an appropriate EC2 instance type

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              EOF
}

# variables.tf - Define variables (optional but useful for scalability)
variable "ami" {
  default = "ami-1234567890"  # Example AMI ID, change for your region
}
```

#### **Terraform Commands**

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration (creates the EC2 instance)
terraform apply
```

---

### ✅ **Day 5: GitHub Actions – Auto Deploy**

#### **Create GitHub Actions Workflow**

Create a `.github/workflows/deploy.yml` file with the following content to deploy your app to EC2 automatically when changes are pushed to GitHub:

```yaml
name: Deploy Node.js App to AWS EC2

on:
  push:
    branches:
      - main  # Trigger deployment on push to the main branch

jobs:
  deploy:
    runs-on: ubuntu-latest  # Use the latest Ubuntu runner

    steps:
      - name: Checkout code
        uses: actions/checkout@v2  # Checkout the repository code

      - name: SSH and deploy
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ubuntu
          key: ${{ secrets.EC2_SSH_KEY }}
          script: |
            docker stop myapp || true
            docker rm myapp || true
            docker pull yourdockerhub/myapp
            docker run -d -p 80:3000 --name myapp yourdockerhub/myapp
```

---

### ✅ **Day 6: Push to DockerHub**

#### **Create DockerHub Account**

1. Sign up on DockerHub at https://hub.docker.com/.

2. After logging in, tag and push your Docker container:

```bash
docker tag myapp yourdockerhub/myapp
docker push yourdockerhub/myapp
```

---

### ✅ **Day 7: Final Polish**

1. **Write `README.md`** to explain how to use the app, Docker, Terraform, and the GitHub Actions setup.
2. **Record a demo video** of your app in action and upload it to GitHub or another platform.
3. **Post about your project** on LinkedIn to showcase your work.
4. **Add the project to your resume**.

---

**End of Project**: You have successfully set up a fully automated, containerized web application that deploys to AWS EC2 using Docker, Terraform, and GitHub Actions!
```

---

### How to Use:
1. Copy the entire block above.
2. Open a text editor (like Notepad or Visual Studio Code).
3. Paste the content into the editor.
4. Save the file as `project_notes.txt` or `README.md` for easy future reference.

Let me know if you have any further questions!)
---

### How to Use:
1. Copy the entire block above.
2. Open a text editor (like Notepad or Visual Studio Code).
3. Paste the content into the editor.
4. Save the file as `project_notes.txt` or `README.md` for easy future reference.

Let me know if you have any further questions!
```
