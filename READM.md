
````markdown
# Auto-Deploy a Web App to AWS using GitHub Actions, Docker, and Terraform

---

### ✅ **part 1: Basic Setup**

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

### ✅ **part 2: Dockerize Your App**

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

### ✅ **part 3-4: Terraform – Create EC2 on AWS**

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

### ✅ **part 5: GitHub Actions – Auto Deploy**

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

### ✅ **part 6: Push to DockerHub**

#### **Create DockerHub Account**

1. Sign up on DockerHub at <https://hub.docker.com/>.

2. After logging in, tag and push your Docker container:

```bash
docker tag myapp yourdockerhub/myapp
docker push yourdockerhub/myapp
```

***

### ✅ **part 7: Final Polish**

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

### How to Use:
1. Copy the entire block above.
2. Open a text editor (like Notepad or Visual Studio Code).
3. Paste the content into the editor.
4. Save the file as `project_notes.txt` or `README.md` for easy future reference.

Let me know if you have any further questions!
```
