#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SERVER_IP="192.168.56.110"
MAX_ATTEMPTS=20
RETRY_INTERVAL=10

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

print_status "Waiting for server to be fully initialized..."
sleep 30

verify_ssh() {
    local ip=$1
    local attempt=1

    print_status "Verifying SSH connection to $ip..."
    while ! ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no vagrant@${ip} "exit" >/dev/null 2>&1; do
        if [ $attempt -ge $MAX_ATTEMPTS ]; then
            return 1
        fi
        print_warning "Attempt $attempt/$MAX_ATTEMPTS - Waiting for SSH..."
        sleep $RETRY_INTERVAL
        ((attempt++))
    done
    print_success "SSH connection established"
    return 0
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

echo -e "${GREEN}"
echo "╔═══════════════════════════════════════╗"
echo "║         K3s Agent Installation        ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

verify_ssh $SERVER_IP || handle_error "Cannot establish SSH connection to server"

print_status "Retrieving node token from server..."
NODE_TOKEN=$(ssh -o StrictHostKeyChecking=no vagrant@${SERVER_IP} "sudo cat /var/lib/rancher/k3s/server/node-token") || handle_error "Failed to retrieve node token"
print_success "Node token retrieved"

print_status "Installing K3s agent..."
curl -sfL https://get.k3s.io | K3S_URL="https://${SERVER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" sh - || handle_error "Failed to install K3s agent"
print_success "K3s agent installed"

wait_for_service k3s-agent || handle_error "K3s agent service failed to start"

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo "║     K3s Agent Setup Complete! 🚀       ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

print_status "Agent node is now connected to the cluster"