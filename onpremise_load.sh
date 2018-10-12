

echo "Load elasticsearch image from file"
command="sudo docker load -i elastic_image.docker"
eval $command

echo "Save redis image"
command="sudo docker load -i redis_image.docker"
eval $command
