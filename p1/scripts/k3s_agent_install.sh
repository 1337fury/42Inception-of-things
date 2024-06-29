#!/bin/bash
SERVER_IP="192.168.56.110"
NODE_TOKEN=$(ssh vagrant@${SERVER_IP} "sudo cat /var/lib/rancher/k3s/server/node-token")
curl -sfL https://get.k3s.io | K3S_URL=https://${SERVER_IP}:6443 K3S_TOKEN=${NODE_TOKEN} sh -