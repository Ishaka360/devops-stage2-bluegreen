# Blue-Green Deployment with Docker Compose and Nginx

This project demonstrates a simple **Blue-Green deployment** setup using **Docker Compose** and **Nginx**.

## 🚀 Overview

- **Blue Environment:** Runs one version of the app.
- **Green Environment:** Runs another version for testing or updates.
- **Nginx Reverse Proxy:** Routes traffic to the active environment (blue or green).

## ⚙️ Setup Instructions

1. Copy `.env.example` to `.env` and set your preferred values.
2. Start containers:
   ```bash
   docker-compose up -d
