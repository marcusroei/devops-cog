

echo "Pull from dockerhub elasticsearch image"
command="docker pull docker.elastic.co/elasticsearch/elasticsearch:6.4.2"
eval $command

echo "docker pull redis:latest"
command="docker pull redis:latest"
eval $command

echo "Save elasticsearch image"
command="docker save -o elastic_image.docker docker.elastic.co/elasticsearch/elasticsearch"
eval $command

echo "Save redis image"
command="docker save -o redis_image.docker redis"
eval $command
