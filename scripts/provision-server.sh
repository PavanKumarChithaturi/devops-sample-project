#!/bin/bash

echo "Updating system packages..."
sudo yum update -y

echo "Installing Docker..."
sudo yum install docker -y

echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding ec2-user to docker group..."
sudo usermod -aG docker ec2-user

echo "Installing Git..."
sudo yum install git -y

echo "Installing Node.js..."
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install nodejs -y

echo "Server provisioning completed!"
