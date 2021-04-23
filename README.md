
sudo docker service rm $(sudo docker service ls --format '{{.ID}}'); sudo docker stop $(sudo docker ps -a -q); sudo docker system prune -a --volumes
sudo docker build --tag immabe .
sudo docker run --publish 5000:5000 immabe


ssh to the running container:
sudo docker ps
sudo docker exec -it <container_id> bash
crontab -l
