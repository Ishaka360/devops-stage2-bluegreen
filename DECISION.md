# Blue-Green Deployment Decision Document

## 1️⃣ Purpose
This document explains the rationale for adopting the **Blue-Green Deployment** strategy in this project. The goal is to enable **zero-downtime deployments** while ensuring rapid rollback and smooth version transitions.

---

## 2️⃣ Background
In traditional deployment approaches, pushing new versions of an application often leads to:
- Temporary service downtime
- Configuration mismatches
- Deployment errors visible to users
- Difficulty in reverting to a previous version

To solve these problems, the Blue-Green deployment model maintains two production-ready environments — **Blue** and **Green** — that operate in parallel.

---

## 3️⃣ Decision
We chose **Blue-Green Deployment** because it allows for:
1. Seamless switching between versions with no interruption to users.  
2. Quick rollback if the new version fails.  
3. Continuous availability of at least one stable environment.  

The **Blue** environment represents the *currently live* version, while **Green** hosts the *upcoming release*. Once the new version is validated, traffic is routed from Blue → Green instantly using **Nginx reverse proxy**.

---

## 4️⃣ Implementation
- Two identical Nginx containers (`blue` and `green`) are defined in `docker-compose.yml`.  
- Environment variables (`ACTIVE_COLOR`) determine which version receives live traffic.  
- The Nginx reverse proxy dynamically updates based on `$ACTIVE_COLOR`.  
- Switching is achieved by editing the `.env` file and restarting the proxy service:
  ```bash
  docker-compose restart reverse-proxy
