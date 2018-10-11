#!/bin/bash
DATE=$(date +'%F %H:%M:%S')
DIR=/tmp
echo "Current date and time: $DATE" > $DIR/file1.txt
echo "Install docker...."

command="sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\""
eval $command

command="sudo apt-get update"
eval $command

command="apt-cache policy docker-ce"
eval $command

command="sudo apt-get install -y docker-ce"
eval $command

echo "Install docker-compose....."
command="sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose"
eval $command
command="sudo chmod +x /usr/local/bin/docker-compose"
eval $command

echo "Install git...."
command="apt-get install git-core"
eval $command
command="sudo apt-get install -y software-properties-common apt-transport-https"
eval $command

echo "Set max_map_count for elasticsearch"
command="sudo sysctl -w vm.max_map_count=262144"
eval $command

echo "Clone repository"
command="git clone https://github.com/marcusroei/devops-cog.git /tmp/"
eval $command

echo "Run app"
command="cd /tmp/devops-cog && sudo docker-compose up -d"
eval $command
