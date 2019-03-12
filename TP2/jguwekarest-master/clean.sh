sudo docker kill $(sudo docker ps -q)
yes | sudo docker system prune
