#!/bin/bash
DATE=$(date +'%F %H:%M:%S')
DIR=/tmp
echo "Current date and time: $DATE"

echo "apt-get update"
command="sudo apt-get update"
eval $command

echo "Install git...."
command="sudo apt-get install -y git-core"
eval $command

command="sudo apt-get install -y software-properties-common apt-transport-https"
eval $command

echo "Install docker...."

echo "First, add the GPG key for the official Docker repository to the system"
command="curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
echo $command

command="sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\""
echo $command
eval $command

command="sudo apt-get update"
eval $command

command="sudo apt-cache policy docker-ce"
eval $command

sleep 5

command="sudo apt-get install -y docker-ce --allow-unauthenticated"
eval $command

sleep 5

echo "Install docker-compose....."
command="sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose"
eval $command
command="sudo chmod +x /usr/local/bin/docker-compose"
eval $command

echo "Set max_map_count for elasticsearch"
command="sudo sysctl -w vm.max_map_count=262144"
eval $command

echo "Clone repository"
command="git clone https://github.com/marcusroei/devops-cog.git /tmp/devops-cog"
eval $command

echo "Run app"
command="cd /tmp/devops-cog && sudo docker-compose up -d"
eval $command
