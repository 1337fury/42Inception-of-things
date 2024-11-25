# 42 Inception of Things (IoT)

A system administration project focused on Kubernetes implementation using K3s and K3d.

## Learning Roadmap

### 1. Foundation (Before Part 1)
- [x] **Virtualization Basics**
  - [x] Understanding Virtual Machines
  - [x] Vagrant fundamentals
  - [x] Basic Vagrant commands
  - [x] Reading Vagrantfile configurations

- [ ] **Linux & Shell**
  - [ ] Basic shell commands
  - [ ] Shell scripting
  - [x] SSH and key management
  - [ ] System services (systemd)

- [ ] **Networking Fundamentals**
  - [x] IP addressing
  - [ ] Network interfaces
  - [x] Port forwarding
  - [ ] Basic network troubleshooting

### 2. Kubernetes Essentials (During Part 1 & 2)
- [ ] **Kubernetes Architecture**
  - [ ] Control plane components
  - [ ] Worker node components
  - [ ] Basic Kubernetes objects

- [ ] **K3s Specific**
  - [ ] K3s vs K8s differences
  - [ ] K3s architecture
  - [ ] Server-agent setup
  - [ ] K3s networking

- [ ] **Basic Kubernetes Operations**
  - [ ] kubectl basics
  - [ ] Pod management
  - [ ] Service creation
  - [ ] Ingress configuration

### 3. Advanced Concepts (For Part 3)
- [ ] **GitOps**
  - [ ] GitOps principles
  - [ ] Infrastructure as Code
  - [ ] Version control best practices

- [ ] **CI/CD & Argo CD**
  - [ ] CI/CD pipeline concepts
  - [ ] Argo CD architecture
  - [ ] Application deployment strategies
  - [ ] K3d concepts and usage

### 4. Project Integration (Bonus)
- [ ] **GitLab Integration**
  - [ ] GitLab architecture
  - [ ] Container registry
  - [ ] GitLab CI/CD
  - [ ] Kubernetes integration

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

## Useful Resources
- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [K3s Documentation](https://docs.k3s.io/)
- [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [Argo CD](https://argo-cd.readthedocs.io/en/stable/)
- [GitLab K8s Integration](https://docs.gitlab.com/ee/user/infrastructure/clusters/)
