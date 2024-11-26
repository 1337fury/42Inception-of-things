#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

MAX_ATTEMPTS=12
RETRY_INTERVAL=5

handle_error() {
    echo -e "${RED}Error: $1${NC}"
    exit 1
}

print_status() {
    echo -e "${BLUE}>>> $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

wait_for_service() {
    local service=$1
    local attempt=1
    
    print_status "Waiting for $service to start..."
    while ! systemctl is-active --quiet $service; do
        if [ $attempt -ge $MAX_ATTEMPTS ]; then
            return 1
        fi
        print_warning "Attempt $attempt/$MAX_ATTEMPTS..."
        sleep $RETRY_INTERVAL
        ((attempt++))
    done
    print_success "$service is running"
    return 0
}

verify_node() {
    local attempt=1
    
    print_status "Verifying node status..."
    while ! kubectl get nodes | grep -q "Ready"; do
        if [ $attempt -ge $MAX_ATTEMPTS ]; then
            return 1
        fi
        print_warning "Attempt $attempt/$MAX_ATTEMPTS..."
        sleep $RETRY_INTERVAL
        ((attempt++))
    done
    print_success "Node is ready"
    return 0
}

echo -e "${GREEN}"
echo "╔═══════════════════════════════════════╗"
echo "║         K3s Server Installation       ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Main installation
print_status "Installing K3s server..."
curl -sfL https://get.k3s.io | sh - || handle_error "Failed to install K3s"
print_success "K3s installed successfully"

# Wait for k3s service
wait_for_service k3s || handle_error "K3s service failed to start"

# Verify kubectl is installed
print_status "Checking kubectl installation..."
command -v kubectl >/dev/null 2>&1 || handle_error "kubectl not installed"
print_success "kubectl is available"

verify_node || handle_error "Node failed to become ready"

# Make token accessible for worker nodes
print_status "Configuring node token permissions..."
sudo chmod 644 /var/lib/rancher/k3s/server/node-token
print_success "Token permissions updated"

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo "║    K3s Server Setup Complete! 🚀      ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

print_status "Current node status:"
kubectl get nodes