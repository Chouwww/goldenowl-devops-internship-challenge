# GOLDEN OWL DEVOPS INTERNSHIP CHALLENGE REPORT

**Author:** Nguyen Thai Bao Chau

**Student ID:** 23520173

**University:** University of Information Technology (UIT)

---

# 1. Technology Stack

| Category | Technology |
|----------|------------|
| Backend | Node.js, Express |
| Programming Language | JavaScript |
| Version Control | GitHub |
| Containerization | Docker |
| Container Registry | Docker Hub |
| CI/CD | GitHub Actions |
| Infrastructure as Code | Terraform |
| Security Scanning | Checkov |
| Cloud Platform | AWS EC2 (Ubuntu Server) |

---

# 2. System Architecture

The project implements an automated CI/CD pipeline for deploying a Dockerized Node.js application on AWS EC2.

**Figure 1. Overall System Architecture**

<img width="1540" height="557" alt="image" src="https://github.com/user-attachments/assets/9bf02906-8c1b-415b-bb59-32714211a385" />

### Workflow

1. Developers push source code to the GitHub repository.
2. Pushes to the **feature/*** branches trigger the **Continuous Integration (CI)** workflow.
3. After the Pull Request is merged into the **master** branch, the **Continuous Deployment (CD)** workflow is triggered automatically.
4. The latest Docker image is deployed to the AWS EC2 instance, and the application becomes accessible through its public endpoint.

---

# 3. CI/CD Pipeline

The CI/CD pipeline is implemented using GitHub Actions.

## 3.1 Continuous Integration

**Trigger**

- Push to `feature/*`
- Push to `master`

**Pipeline Steps**

1. Checkout source code.
2. Set up the Node.js environment.
3. Install project dependencies (`npm install`).
4. Run application tests (`npm test`).
5. Perform Infrastructure as Code (IaC) security scanning using Checkov.

The application testing and infrastructure security scanning jobs are executed in parallel to reduce workflow execution time. The deployment stage is executed only after all Continuous Integration jobs complete successfully.

**Workflow Result**

<img width="983" height="438" alt="image" src="https://github.com/user-attachments/assets/1fd6cd65-36fa-4b4c-a49a-b03d55e39848" />

---

## 3.2 Continuous Deployment

**Trigger**

- Merge into `master`

**Pipeline Steps**

1. Build the Docker image.
2. Push the Docker image to Docker Hub.
3. Connect to the AWS EC2 instance via SSH.
4. Pull the latest Docker image.
5. Stop and remove the existing application container.
6. Start a new container using the latest image.

**Workflow Result**

<img width="935" height="447" alt="image" src="https://github.com/user-attachments/assets/420654e2-537c-4d62-bb74-91185d672c96" />

---

# 4. Project Structure

```text
goldenowl-devops-internship-challenge/
├── .github/
│   └── workflows/
│       └── main.yml
│
├── src/
│   ├── routes/
│   ├── server/
│   ├── tests/
│   ├── index.js
│   ├── package.json
│   └── package-lock.json
│
├── terraform/
│   └── main.tf
│
├── Dockerfile
└── README.md
```

---

# 5. Deployment

| Item | Description |
|------|-------------|
| Cloud Platform | Amazon Web Services (AWS) |
| Compute Service | EC2 Ubuntu Server |
| Container Runtime | Docker Engine |
| Container Registry | Docker Hub |
| Deployment Method | GitHub Actions + SSH |
| Application URL | http://52.78.154.3/ |

---

# 6. Deployment Results

The application was successfully deployed to AWS EC2 through the automated GitHub Actions deployment pipeline.

### AWS EC2 Instance

<img width="1912" height="306" alt="image" src="https://github.com/user-attachments/assets/8082f92e-1dec-48db-820a-1e5a1e5a146c" />

### Docker Hub Repository

<img width="962" height="628" alt="image" src="https://github.com/user-attachments/assets/5eb75236-ba4d-4d54-ad87-b79b1d7899ce" />

### Running Docker Container

<img width="950" height="130" alt="image" src="https://github.com/user-attachments/assets/e4e8e828-0e36-4eee-b53f-c24c1af811a4" />

### Running Application

The application is successfully deployed and can be accessed via the EC2 public IP.

**Endpoint**

```
http://52.78.154.3/
```
<img width="923" height="196" alt="image" src="https://github.com/user-attachments/assets/6ee16019-a042-4630-93c0-d1fea8b2a479" />








