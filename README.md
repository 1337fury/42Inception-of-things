# 42 Inception of Things (IoT)

A system administration project focused on Kubernetes implementation using K3s and K3d.

## Project Checklist

### Part 1: K3s and Vagrant
- [x] Setup Vagrant configuration
  - [x] Configure Server VM (192.168.56.110)
  - [x] Configure ServerWorker VM (192.168.56.111)
- [ ] K3s Installation
  - [ ] Server: Controller mode setup
  - [ ] ServerWorker: Agent mode setup
- [ ] Configure SSH password-less access
- [ ] Test cluster connectivity

### Part 2: K3s and Three Simple Applications
- [ ] Single VM Setup
  - [ ] Install K3s in server mode
  - [ ] Configure networking
- [ ] Application Deployment
  - [ ] Deploy App1 (app1.com)
  - [ ] Deploy App2 (app2.com) with 3 replicas
  - [ ] Deploy App3 (default)
- [ ] Ingress Configuration
  - [ ] Setup hostname-based routing
  - [ ] Test all endpoints

### Part 3: K3d and Argo CD
- [ ] Environment Setup
  - [ ] Install Docker
  - [ ] Install K3d
  - [ ] Create installation script
- [ ] Namespace Creation
  - [ ] Create Argo CD namespace
  - [ ] Create dev namespace
- [ ] Application Setup
  - [ ] Configure GitHub repository
  - [ ] Deploy application v1
  - [ ] Test version upgrade to v2

### Bonus
- [ ] GitLab Integration
  - [ ] Create gitlab namespace
  - [ ] Deploy local GitLab instance
  - [ ] Configure Kubernetes integration
  - [ ] Setup CI/CD pipeline

## Requirements Status
- [x] Vagrant
- [x] VirtualBox
- [ ] K3s
- [ ] K3d
- [x] Docker
- [x] Git
